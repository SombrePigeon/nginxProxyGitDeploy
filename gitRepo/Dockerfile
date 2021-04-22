FROM alpine:latest

MAINTAINER SombrePigeon "contact@alexismartial.fr"

RUN apk update 

#ssh

RUN apk add openssh

WORKDIR /root

RUN mkdir .ssh

#git

RUN apk add git

RUN git config --global init.defaultBranch main

RUN mkdir repo

WORKDIR repo

RUN git init --bare

#docker
RUN apk add docker docker-compose

#RUN git init --shared=true

#start ssh server
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["ssh-keygen -A \
&& cat /etc/ssh/ssh_host_rsa_key.pub > /etc/ssh/ssh_host_rsa_key.pub.share \
&& /usr/sbin/sshd -D "]