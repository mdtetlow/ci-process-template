# CI Process Template

A basic CI template to demonstrate the process in a tool agnostic manner.

This project template consists of three parts

  - Example-Java-Project, a basic java application consisting of a single util class and some unit tests
  - CI, a set of scripts to perform the standard CI phases
  - Dockerfile, a Docker build file to build an image/container to run the CI process

# CI Scripts - how to run the build, test and package phases on a Linux host machine

In order to run the CI scripts on a host machine,
you will need a Linux machine with the following pachages installed:
  - Java JDK < Java 9
  - Apache Maven

Perform the following tasks:

  - change directory into CI: $ cd CI
  - Setup the environment: $ . env.sh
  - Build phase: $ ./build.sh $JAVA_PROJECT_DIR
  - Test phsase: $ ./test.sh $JAVA_PROJECT_DIR
  - Package phase: $ ./package.sh $JAVA_PROJECT_DIR
  - Clean: $ ./clean.sh $JAVA_PROJECT_DIR

# Docker - How to run the build, test and package phases on a Docker container

In order to utilise Docker in this example, you will need a Linux machine with docker installed
and your user id will need to be added to the docker group.

Perform the following tasks to build the docker image:

  - change directory to the directory containing the Dockerfile
  - build docker image: $ docker build -t ci-dev .

Perform the following task to run the docker container:
  - run docker container: $ docker run -it ci-dev /bin/bash

Perform the following tasks in the running docker container to perform the ci phases:

  - Build phase: $ ./build.sh $JAVA_PROJECT_DIR
  - Test phsase: $ ./test.sh $JAVA_PROJECT_DIR
  - Package phase: $ ./package.sh $JAVA_PROJECT_DIR

Outside of the docker container, use "docker cp" to copy the deployed application out of the container:

  - docker cp container_name:/home/dev/CI/Example-Java-Project.tar.gz .

# Known issues

  - This markdown file is too sparse and needs properly formatting
  - The Docker solution is only partially complete/working.
  - Docker entry script needed to drive phases without docker run command needing to be interactive.
  - Deployed java application util jar untested.
  - No instructions on how to test deployed application.
  - FIXED: Dockerfile COPY directory is not working properly resulting in files owned by root.
