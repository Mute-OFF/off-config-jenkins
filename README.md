
# Jenkins Docker Configuration Linux
##### (With docker jenkins/slave agent)

## Installation

### Docker

Install docker [manually](https://docs.docker.com/engine/install/) or with [docker desktop](https://www.docker.com/get-started/).

Then update the docker service file
```text
    sudo vim /lib/systemd/system/docker.service
```

Comment this line (with '#'):
```
    ExecStart=/usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock
```

Replace it by:
```
    ExecStart=/usr/bin/dockerd -H tcp://0.0.0.0:4243 -H unix:///var/run/docker.sock
```

And restart docker
```bash
    sudo systemctl daemon-reload
    sudo service docker restart
```

You can check if this setting works with this command:
```bash
    curl http://localhost:4243/version
```

It will give you something like this:
```json
{
  "Platform": { "Name": "Docker Engine - Community" },
  "Components": [
    {
      "Name": "Engine",
      "Version": "20.10.16",
      ...
    },
  ...
}
```

### Install Local

Go to the project directory

```bash
  cd .../off-config-jenkins-docker/
```

Create jenkins workspace:
```bash
    mkdir ~/jenkins
```

And copy the jenkins config file in the workspace
```bash
    cp jenkins.yml ~/jenkins/jenkins.yml
```

Add these variables to your environment:
```
    JENKINS_ADMIN_ID=<username>
    JENKINS_ADMIN_SECRET=<password>
    DOCKER_API_IP=<your-ip>
    DOCKER_API_PORT=4243
```

## Deploy

Go to the project directory

```bash
  cd .../off-config-jenkins-docker/
```

And build then run the docker compose
```bash
    (sudo) docker compose build
    (sudo) docker compose up -d
```
