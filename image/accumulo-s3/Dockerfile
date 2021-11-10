FROM openjdk:11

RUN apt update; \
    apt install -y iproute2 build-essential wget maven;

ENV ACCUMULO_VERSION=1.9.3
ENV HADOOP_VERSION=3.3.0
ENV ZOOKEEPER_VERSION=3.7.0
ENV ACCUMULO_HOME=/opt/accumulo
ENV HADOOP_HOME=/opt/hadoop
ENV ZOOKEEPER_HOME=/opt/zookeeper

ARG ACCUMULO_RELEASE_URL=https://www.dropbox.com/s/ey1odo5dy75lb0h/accumulo-1.9.3-bin.tar.gz?dl=0
#https://downloads.apache.org/accumulo/${ACCUMULO_VERSION}/accumulo-${ACCUMULO_VERSION}-bin.tar.gz
ARG HADOOP_RELEASE_URL=https://downloads.apache.org/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz
ARG ZOOKEEPER_RELEASE_URL=https://downloads.apache.org/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz

# TODO replace branch version with release version
#ARG S3_FILESYSTEM_VERSION=2.0.1
#ARG S3_FILESYSTEM_URL=https://github.com/Accumulo-S3/accumulo-s3-fs/archive/refs/tags/rel/${RELEASE_VERSION}.zip
ARG S3_FILESYSTEM_BRANCH=1.9.3
ARG S3_FILESYSTEM_URL=https://github.com/Accumulo-S3/accumulo-s3-fs/archive/${S3_FILESYSTEM_BRANCH}.zip

WORKDIR /tmp

# download and install accumulo along with its hadoop+zookeeper dependencies
RUN wget --no-check-certificate ${ACCUMULO_RELEASE_URL} -O accumulo-${ACCUMULO_VERSION}-bin.tar.gz; \
    wget ${HADOOP_RELEASE_URL}; \
    wget ${ZOOKEEPER_RELEASE_URL}; \
    tar -xf accumulo-${ACCUMULO_VERSION}-bin.tar.gz; \
    tar -xf hadoop-${HADOOP_VERSION}.tar.gz; \
    tar -xf apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz; \
    mv accumulo-${ACCUMULO_VERSION} ${ACCUMULO_HOME}; \
    mv hadoop-${HADOOP_VERSION} ${HADOOP_HOME}; \
    mv apache-zookeeper-${ZOOKEEPER_VERSION}-bin ${ZOOKEEPER_HOME};

# build the s3 filesystem jar
RUN wget ${S3_FILESYSTEM_URL}; \
    unzip ${S3_FILESYSTEM_BRANCH}.zip; \
    cd accumulo-s3-fs-${S3_FILESYSTEM_BRANCH}; \
    mvn clean package; \
    mv target/*.jar ${ACCUMULO_HOME}/lib; \
    cp /root/.m2/repository/com/amazonaws/aws-java-sdk-bundle/*/*.jar ${ACCUMULO_HOME}/lib

# cleanup downloaded tar files
RUN rm -rf /tmp/*;

# build native binaries
#RUN ${ACCUMULO_HOME}/bin/accumulo-util build-native

WORKDIR ${ACCUMULO_HOME}