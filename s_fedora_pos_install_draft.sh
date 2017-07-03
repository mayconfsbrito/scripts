#!/bin/bash

dnf remove docker \
                  docker-common \
                  container-selinux \
                  docker-selinux \
                  docker-engine -y

dnf -y install dnf-plugins-core

dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo

dnf makecache fast

dnf install docker-ce -y

systemctl start docker

systemctl enable docker

docker run hello-world

