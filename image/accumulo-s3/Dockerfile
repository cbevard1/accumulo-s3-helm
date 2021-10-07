FROM openjdk:11

RUN apt update; && \
    apt install -y iproute2 build-essential; && \
    apt-get install -y wget; \

ARG ACCUMULO_VERSION="2.0.1"
ARG HADOOP_VERSION="3.3.0"
ARG ZOOKEEPER_VERSION="3.7.0"

ARG ACCUMULO_RELEASE_URL=https://downloads.apache.org/accumulo/${ACCUMULO_VERSION}/accumulo-${ACCUMULO_VERSION}-bin.tar.gz
ARG HADOOP_RELEASE_URL=https://downloads.apache.org/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz
ARG ZOOKEEPER_RELEASE_URL=https://downloads.apache.org/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz

RUN mkdir /tmp/accumulo; \
    mkdir /tmp/hadoop; \
    mkdir /tmp/zookeeper; \
    wget ${ACCUMULO_RELEASE_URL} /tmp/accumulo; \
    wget ${HADOOP_RELEASE_URL} /tmp/hadoop; \
    wget ${ZOOKEEPER_RELEASE_URL} /tmp/zookeeper; \
    tar -xf /tmp/accumulo/accumulo-${ACCUMULO_VERSION}-bin.tar.gz -C /opt/accumulo; \
    tar -xf /tmp/hadoop/hadoop-${ACCUMULO_VERSION}-bin.tar.gz /opt/hadoop; \
    tar -xf /tmp/zookeeper/apache-zookeeper-${ACCUMULO_VERSION}-bin.tar.gz /opt/zookeeper;

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