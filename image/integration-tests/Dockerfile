FROM openjdk:11

ENV REPO_LINK=git@github.com:Accumulo-S3/accumulo.git
ENV REPO_BRANCH=master

#RUN apt-get update; \
#    apt-get install -y git; \
#    apt-get install -y maven
#RUN mkdir ~/.ssh; \
#    ssh-keyscan -t rsa github.com > ~/.ssh/known_hosts
#RUN git clone ${$REPO_LINK}; \
#    git checkout ${$REPO_BRANCH} \
RUN mkdir /root/.ssh/ && \
	mkdir /repository && \
	touch /root/.ssh/known_hosts && \
	ssh-keyscan -H github.com >> /root/.ssh/known_hosts && \
	ssh-keyscan bitbucket.org >> /root/.ssh/known_hosts && \
	echo "\nStrictHostKeyChecking no" >> /etc/ssh/ssh_config

ADD init.sh /
RUN chmod +x /init.sh

# Clean up
RUN apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/bin/bash while true; do sleep 30; done;"]
#CMD ["/init.sh"]
#RUN pwd
#WORKDIR /opt/accumulo
#RUN mvn clean test -Dtest=org.apache.accumulo.s3.*
