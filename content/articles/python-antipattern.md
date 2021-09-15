---
title: Python Anti-Pattern
date: 2021-09-14T21:18:32-04:00
draft: false
description: Python Anti-Pattern
keywords: python, coding anti-pattern
url: /articles/python-anti-pattern/
toc: false
tags:
  - python
  - coding anti-pattern
images:
  - /images/python_antipattern/python.png
---

I was writing a lambda function which, among other things, was supposed to read a csv file from S3, perform some validation on every row, then use boto3 to perform an S3 multipart upload.

I created a wrapper class around the multipart upload functionality and I was using it inside the `lambda_handler`. The code is simplified for brevity.

```python
class S3MultipartUploader:
    """
    Wrapper class around the S3 multipart upload functionality.
    """
    def __init__(self, key: str, multipart_id: str = None, parts: List = []) -> None:
        self._bucket = 'bucket'
        self._key = key
        self._s3_client = boto3.client('s3')
        self._multipart_id = multipart_id or self._create_multipart()
        self._parts = parts
    
    def _create_multipart(self) -> str:
        """
        Create and return a multipart id that will be used for subsequent multipart uploads.
        """
        response = self._s3_client.create_multipart_upload(Bucket=self._bucket, Key=self._key)
        return response['UploadId']

    def upload_part(self, data: bytes) -> None:
        """
        Upload data as a multipart.
        Calculate PartNumber from self._parts length.

        :param data: Data to be uploaded.
        """
        part_number = len(self._parts) + 1
        response = self._s3_client.upload_part(
            Body=data, Bucket=self._bucket, Key=self._key, UploadId=self._multipart_id,
            PartNumber=part_number
        )
        self._parts.append({'PartNumber': part_number, 'ETag': response['ETag'], })

    def complete_upload(self) -> None:
        """
        Finish the multipart upload after all the parts have been uploaded.
        """
        return self._s3_client.complete_multipart_upload(
            Bucket=self._bucket, Key=self._key, UploadId=self._multipart_id,
            MultipartUpload={'Parts': self._parts, }
        )


def lambda_handler(event: Dict, context: Dict) -> None:
    multipart_uploader = S3MultipartUploader(key=event.get('multipart_s3_key'))

    # read the CSV file row by row and keep storing rows into a buffer
    # when buffer > 6MB do a multipart upload
    buffer = CSVBuffer()
    for row in read_s3_csv(event.get('intake_s3_key')):
        buffer.write_row(validate_row(row))
        if buffer.size > 6291456:  # 6 MB
            multipart_uploader.upload_part(buffer)
            buffer.reset()

    # multipart upload the remaining buffer and complete the multipart upload
    multipart_uploader.upload_part(buffer)
    multipart_uploader.complete_upload()
```

Everything worked great, until it didn't.

Initial invocations of the lambda function were completing successfully, but subsequent invocations of the lambda function within the same container were randomly failing with the following error:

`"An error occurred (InvalidPart) when calling the CompleteMultipartUpload operation: One or more of the specified parts could not be found. The part may not have been uploaded, or the specified entity tag may not match the part's entity tag."`

The error was thrown by `multipart_uploader.complete_upload()`, but I wasn't sure why.

This is what was happening:

1. A cold lambda function is invoked which initializes a new container.
2. The lambda function starts processing the csv file row by row and starts multipart uploading 6MB parts. It uploads 5 parts in this case.
3. The lambda function completes the multipart upload.
4. The lambda function successfully completes execution.
5. A new warm lambda function is invoked, which reuses the same container.
6. The new lambda function starts processing another csv file and starts uploading 6MB parts. It should upload 10 parts in this case.
7. The lambda function tries to complete the multipart upload, but the `InvalidPart` exception is thrown.

### Debugging

The logs were showing that the lambda function was actually trying to complete the multipart upload of a total of 15 parts, not 10 parts as it was supposed to. The ETags of the 15 uploaded parts were composed of the first 5 ETags of the parts that were already uploaded by the previous lambda function, and the 10 ETags created during the current lambda invocation.

Alright... What the fuck?!

Why was the current lambda function still keeping track of the previous lambda functions uploaded parts?

Well... it's because I was [using a mutable default value as an argument](https://docs.quantifiedcode.com/python-anti-patterns/correctness/mutable_default_value_as_argument.html).

`
Passing mutable lists or dictionaries as default arguments to a function can have unforeseen consequences. Usually when a programmer uses a list or dictionary as the default argument to a function, the programmer wants the program to create a new list or dictionary every time that the function is called. However, this is not what Python does. The first time that the function is called, Python creates a persistent object for the list or dictionary. Every subsequent time the function is called, Python uses that same persistent object that was created from the first call to the function.
`

My `S3MultipartUploader.__init__` method was defaulting the `parts` argument to an empty list `[]`.

The initial cold lambda was initialing the `S3MultipartUploader` object with `parts` as an empty list `[]`, but the subsequent lambda was not. It was `reusing` the same list that was used by the first lambda, and it was `appending` parts to it.

This was possible because lambdas can reuse containers, meaning that resources are shared between lambda invocations in order to speed them up.

And if you're not careful you can end up with unwanted data leaks between invocations.

### Solution

After understanding what was going on, the fix was easy.

```python
def __init__(self, key: str, multipart_id: str = None, parts: List = None) -> None:
    self._bucket = 'bucket'
    self._key = key
    self._s3_client = boto3.client('s3')
    self._multipart_id = multipart_id or self._create_multipart()
    self._parts = [] if parts is None else parts
```

Instead of defaulting `parts` to a mutable empty list `[]`, default it to the immutable `None` object.

Everything worked as expected after that.
