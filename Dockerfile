FROM jenkins/jenkins:lts

# Copy all files for: plugins, jenkins config

USER root

RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz

USER jenkins

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

# Install all plugins needed for jenkins when run the image

RUN  /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt