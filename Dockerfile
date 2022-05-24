FROM jenkins/jenkins:lts

# Copy all files for: plugins, jenkins config

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

# Install all plugins needed for jenkins when run the image

RUN  /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt