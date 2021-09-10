---
title: The Beauty of Building Software
date: 2020-01-25T19:39:43-05:00
draft: true
description: the beauty of building software
keywords: software, blog
url: /posts/the-beauty-of-building-software
toc: false
images:
  - /images/software_is_beautiful/colors.png
tags:
  - software
---

One of my latest adventures in the world of software was to update the CI/CD for one of our repositories. The plan was to move away from using Jenkins in favor of a full CI/CD GitLab pipeline.

I've worked with Jenkins for a few years and I think it's a solid CI/CD and build tool. It's highly configurable and it will get the job done.  
It also needs maintenance. You have to run and configure a Jenkins server, which adds up to the (probably) high list of apps that need to be maintained.

GitLab has a [built in CI/CD tool](https://docs.gitlab.com/ee/ci/) which is configured by a **.gitlab-ci.yml** file placed in the repos root folder. Instead of maintaining an app server, you *just* have to write a yml file.

The **.gitlab-ci.yml** contains scripts that will be executed by [GitLab Runners](https://docs.gitlab.com/runner/) when code is pushed to the repo. Scripts can be grouped together into jobs. You can have a build job, a test job, a deploy job, a documentation job, etc. You can define your jobs to run in a specific order, together composing a pipeline.

#### Writing the first job

That's what I had to do. I had to create a **.gitlab-ci.yml** file for this repo in order to test, build and deploy the app to specific environments.

I haven't worked with GitLab pipelines before. This was all new to me. And I had a great time doing it.

I started by reading the [documentation](https://docs.gitlab.com/ee/ci/yaml/), and GitLab's is excellent. Every question I had was answered in the docs. It was great to read through and understand how all the different pieces work and how they can creatively be combined together.

The first thing I tried was to write a simple script that runs the unit tests. When new code was pushed to a **feature** branch, I wanted GitLab to run unit tests against the code through the CI. It was great to see the GitLab Runner kick in on every code push.

#### Creating the pipeline

I was done with the easy part. The tricky part was, when the code was merged into the **master** branch, a pipeline that looks something like this had to be executed:

```
unit test -> deploy changeset -> build container -> deploy container -> sanity check -> tag
```

The pipeline will run the unit tests again, deploy the AWS stack changeset, build a Docker container and push it to ECR, deploy the container to ECS, run a basic sanity, and finally tag the code.

If you don't know what all of this is, don't worry about it too much. The idea is that each stage has to successfully run in order for the next stage to be executed.

As I was writing the jobs, the pipeline was slowly coming together and I would often push the code in order to test the changes. This part was as intense as it was exciting.

I could see the pipeline running in the GitLab UI, and every time I would make a job pass, in that moment, I was the happiest man alive.

But during the time when a job would run, not knowing if it will actually pass this time or fail again, I was on the edge of my seat. I realized that sometimes I would involuntarily hold my breath in this situation.

After many happy, intense and some frustrating moments, I ended up writing the last job, where I had to tag the code that was deployed. This one was special. While at the edge of my seat again, I triggered the entire pipeline. I was watching how it was slowly progressing and... it passed! In that moment I thought *this is what I was born to do*.

#### Software is beautiful

That was one of many moments where I reminded myself that building software is beautiful.  
It's an art. 

As engineers we deal with errors, bugs and new features on the regular. We use a lot of brain power trying to understand problems and to find the best solutions for them. Confusion and frustration are part of the job, but with time a good engineer will know how to handle these emotions and will learn how to be calm and collected under stress. These qualities can serve you greatly in the real world.

We also spend a good amount of time on research. We check if other people have encountered the same problem, read documentations, comments, code. It can become exhausting.

But after all that mental effort, we're rewarded with this magical thing that does what it's supposed to do because we told it to do it that way. It's a beautiful creative process.
