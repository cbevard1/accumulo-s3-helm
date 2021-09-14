
FROM openjdk:11

RUN apt update && \
    apt install -y iproute2 build-essential

ARG ACCUMULO_VERSION="2.1.0-SNAPSHOT-S3"
ARG HADOOP_VERSION="3.3.0"
ARG ZOOKEEPER_VERSION="3.7.0"

ADD accumulo-${ACCUMULO_VERSION}-bin.tar.gz /opt
ADD hadoop-${HADOOP_VERSION}.tar /tmp
ADD apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar /tmp

ENV HADOOP_HOME=/opt/hadoop
ENV ZOOKEEPER_HOME=/opt/zookeeper

RUN ln -s /opt/accumulo-${ACCUMULO_VERSION} /opt/accumulo
RUN mkdir -p ${HADOOP_HOME}/etc/hadoop && \
    mkdir -p ${HADOOP_HOME}/share/hadoop/client && \
    mkdir -p ${HADOOP_HOME}/share/hadoop/common/lib && \
    mkdir -p ${ZOOKEEPER_HOME}/lib && \
    mkdir /opt/extralibs
RUN mv /tmp/hadoop-${HADOOP_VERSION}/etc/hadoop/* ${HADOOP_HOME}/etc/hadoop && \
    mv /tmp/hadoop-${HADOOP_VERSION}/share/hadoop/client/* ${HADOOP_HOME}/share/hadoop/client && \
    mv /tmp/hadoop-${HADOOP_VERSION}/share/hadoop/common/lib/* ${HADOOP_HOME}/share/hadoop/common/lib && \
    mv /tmp/apache-zookeeper-${ZOOKEEPER_VERSION}-bin/lib/* ${ZOOKEEPER_HOME}/lib
ADD extralibs /opt/extralibs

RUN /opt/accumulo/bin/accumulo-util build-native

WORKDIR /opt/accumulo/bin