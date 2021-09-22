FROM openjdk:11

ENV REPO=git@github.com:Accumulo-S3/accumulo.git
ENV BRANCH=master

RUN apt-get update; \
    apt-get install -y git; \
    apt-get install -y maven
RUN mkdir ~/.ssh; \
    ssh-keyscan -t rsa github.com > ~/.ssh/known_hosts
RUN git clone ${REPO}; \
    git checkout ${BRANCH} \

#RUN pwd
#WORKDIR /opt/accumulo
#RUN mvn clean test -Dtest=org.apache.accumulo.s3.*
