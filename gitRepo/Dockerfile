FROM ghcr.io/linuxserver/openssh-server

MAINTAINER SombrePigeon "contact@alexismartial.fr"

#install packages

RUN apk update --no-cache

RUN apk add docker docker-compose

RUN apk add git

#git

RUN git config --global init.defaultBranch main

RUN mkdir /repo

WORKDIR repo

#RUN git init --bare

RUN git init --shared=true

#fix for everything
RUN chmod -R 777 /repo 
