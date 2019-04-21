FROM centos

RUN yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel
RUN yum install -y maven
#RUN yum install -y vim

ENV JAVA_HOME /usr/lib/jvm/java

# Create a user so the container doesn't run as root
#RUN useradd -ms /bin/bash dev
#USER dev

RUN mkdir ~/CI
RUN mkdir ~/CI/log
RUN mkdir -p ~/CI/tools/pkg
RUN mkdir ~/Example-Java-Project

COPY ./CI/ /home/dev/CI/
COPY ./Example-Java-Project/ /home/dev/Example-Java-Project/

# Create a user so the container doesn't run as root
RUN useradd -ms /bin/bash dev

# workaround to set the home directory permissions otherwise maven can't create repo
RUN chown -R dev /home/dev

USER dev

ENV JAVA_PROJECT_DIR /home/dev/Example-Java-Project
WORKDIR /home/dev/CI

