# docker-sbt
Dockerfile for generating sbt images from openjdk.

This is built on top of the
[openjdk](https://hub.docker.com/_/openjdk/) image
and is inspired by Mozilla's own docker-sbt
[mozilla/sbt](https://github.com/mozilla/docker-sbt).

## Motivation

openjdk proposes a wide range of docker images to base from. Not all of them are from the same distribution.
Some are Red Hat based and others, Debian.

To make it easier for anyone to build the sbt image from any version of openjdk regardless of the
base OS, this image will verify which package manager is available.

## Limitation

- This will not work for openjdk Windows specific images
- The main user is root

## Usage

It is assumed you already have docker installed.

Login to Docker Hub

    docker login
    
Pull the image. By the default, the image is uses openjdk 11 (tagged with 11.0.8-jdk).

    docker pull gumol/docker-sbt

To run a command against your project assuming your running the container in its directory:

    docker run -it --rm -w "/usr/app" -v "$PWD":/usr/app gumol/docker-sbt sbt <SBT_COMMAND>

## Building

To build, you need to specify the desired openjdk and sbt versions via
`--build-arg` parameters:

    docker build --build-arg OPENJDK_TAG=11.0.8-jdk --build-arg SBT_VERSION=1.3.13 .
