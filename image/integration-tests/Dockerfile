FROM openjdk:11

ENV REPO_NAME=accumulo-s3-fs
ENV REPO_BRANCH=1.9.3
ENV REPO_LINK=https://github.com/Accumulo-S3/${REPO_NAME}/archive/${REPO_BRANCH}.zip

RUN apt-get update; \
    apt-get install -y wget; \
    apt-get install -y maven; \
    apt-get install -y make; \
    apt-get install -y g++;

RUN mkdir /test

WORKDIR /
