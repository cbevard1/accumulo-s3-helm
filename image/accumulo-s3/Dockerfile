FROM openjdk:11

RUN apt-get clean; \
    apt-get update; \
    apt-get install -y iproute2 build-essential wget maven;

ENV ACCUMULO_VERSION=2.1.0-SNAPSHOT
ENV ZOOKEEPER_VERSION=3.7.0
ENV ACCUMULO_HOME=/opt/accumulo
ENV HADOOP_HOME=/opt/hadoop
ENV ZOOKEEPER_HOME=/opt/zookeeper

#ARG ACCUMULO_RELEASE_URL=https://downloads.apache.org/accumulo/${ACCUMULO_VERSION}/accumulo-${ACCUMULO_VERSION}-bin.tar.gz
#ARG HADOOP_RELEASE_URL=https://downloads.apache.org/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz
ARG ZOOKEEPER_RELEASE_URL=https://downloads.apache.org/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz

# TODO replace branch version with release version

ARG ACCUMULO_BRANCH=s3a_fs
ARG ACCUMULO_BRANCH_URL=https://github.com/Accumulo-S3/accumulo/archive/${ACCUMULO_BRANCH}.zip

WORKDIR /tmp

# download and install zookeeper dependency
RUN wget ${ZOOKEEPER_RELEASE_URL}; \
    tar -xf apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz; \
    mv apache-zookeeper-${ZOOKEEPER_VERSION}-bin ${ZOOKEEPER_HOME};

# download and build the s3 compatible version of accumulo
RUN wget ${ACCUMULO_BRANCH_URL}; \
    unzip ${ACCUMULO_BRANCH}.zip; \
    cd accumulo-${ACCUMULO_BRANCH}; \
    mvn -T 32 -Drat.skip=true -DskipTests=true clean package; \
    cd assemble/target; \
    tar -xf accumulo-${ACCUMULO_VERSION}-bin.tar.gz; \
    mv accumulo-${ACCUMULO_VERSION} ${ACCUMULO_HOME}

# cleanup downloaded tar files
RUN rm -rf /tmp/*;

# build native binaries
RUN ${ACCUMULO_HOME}/bin/accumulo-util build-native

WORKDIR ${ACCUMULO_HOME}