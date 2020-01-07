---
title: The Beauty of Building Software
date: 2020-01-06T19:39:43-05:00
draft: true
description: the beauty of building software
keywords: software, blog
url: /posts/the-beauty-of-building-software
toc: false
# images:
tags:
  - software
  - blog
---

One of my latest adventures in the world of software was to update the CI/CD for one of our repositories. The plan was to move away from using Jenkins in favor of a full CI/CD GitLab pipeline.

I've worked with Jenkins for a few years and I think that it is a solid CI/CD and build tool. It's highly configurable and it will get the job done.  
It also needs maintenance. You have to run and configure a Jenkins server, which adds up to the (probably) high list of apps that need to be maintained.

GitLab has a [built in CI/CD tool](https://docs.gitlab.com/ee/ci/) which is configured by a **.gitlab-ci.yml** file placed in the repos root folder. Instead of maintaining an app server, you *just* have to write a yml file.

The **.gitlab-ci.yml** contains scripts that will be executed by GitLab Runners when code is pushed to the repo. Scripts can be grouped together into jobs. You can have a build job, a test job, a deploy job, a documentation job etc. You can define your jobs to run in a specific order, together composing a pipeline.

#### Creating the pipeline

That's what I had to do. I had to create a **.gitlab-ci.yml** file for this repo in order to test, build and deploy the app to specific environments.

I haven't worked with GitLab pipelines before. This was all new to me. And I had a great time doing it.

The [documentation](https://docs.gitlab.com/ee/ci/yaml/) they offer is excellent. Every question I had was answered in the docs. It was great to read through and understand how all the different pieces work and how they can creatively be combined together.

The first part was to run the tests. When new code was pushed to a **feature** branch, I wanted GitLab to run unit tests against the code through the CI. I have to admit that part was pretty easy.

The tricky part was, when the code was merged into the **master** branch, a pipeline that looks something like this had to be executed:

```
unit test -> deploy changeset -> build container -> deploy container -> sanity check -> tag
```

The pipeline will run the unit tests again, then it will create and deploy AWS stack changeset, then it will build a Docker container and push it to ECR, then it will deploy the container to ECS, a basic sanity will be run to make sure deployment was successfull, then we tag the code.

If you don't know what all of this is, don't worry about it too much. The idea is that each stage has to successfully run in order for the next stage to be executed.

The discovery of how new technologies work. Understanding them. Using creativity.

#### Running the pipeline

Push
some work (happy) then it fails (sad)

#### This is what I was born to do

Seeing it work flawlessly