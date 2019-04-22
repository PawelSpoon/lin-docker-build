FROM ubuntu:latest
# following this: https://draculaservers.com/tutorials/install-docker-ubuntu-18-04/
# to install docker-compose on ubuntu docker image

# to start and stop dockerservice check this: https://stackoverflow.com/questions/27879713/is-it-ok-to-run-docker-from-inside-docker
# in the end you have to start external docker with: --privileged=true
# and then manually start docker service with: service docker start
# you can verify the status with: service docker status

# update package index
RUN apt update

# Install the necessary packages so apt can use packages over HTTPS:
RUN apt install --assume-yes apt-transport-https ca-certificates curl software-properties-common

# Add the official Docker repository’s GPG key to your system:
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

# Add the Docker APT repository to your system’s APT sources:
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

# again
RUN apt update

# install docker common edition
RUN  apt install --assume-yes docker-ce

# and now following this: https://draculaservers.com/tutorials/install-use-docker-compose-ubuntu-18-04/
# we are going to install docker -compose 

# install docker - compose
RUN curl -L https://github.com/docker/compose/releases/download/1.24.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

# Set executable permissions to the Docker Compose binary:
RUN chmod +x /usr/local/bin/docker-compose

# finally install make, this is part of build-essentials
RUN apt-get --assume-yes install build-essential

# and the last one
RUN apt update
