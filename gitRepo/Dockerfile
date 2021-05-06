FROM alpine:latest

MAINTAINER SombrePigeon "contact@alexismartial.fr"

#install packages

RUN apk update --no-cache

RUN apk add docker docker-compose

RUN apk add git

#ssh

RUN apk add openssh

WORKDIR /root

RUN mkdir .ssh

##secure ssh
RUN sed -i '/ChallengeResponseAuthentication/c\ChallengeResponseAuthentication no' /etc/ssh/sshd_config

RUN sed -i '/PasswordAuthentication/c\PasswordAuthentication no' /etc/ssh/sshd_config

RUN sed -i '/PubkeyAuthentication/c\PubkeyAuthentication yes' /etc/ssh/sshd_config

RUN sed -i '/PermitRootLogin/c\PermitRootLogin yes' /etc/ssh/sshd_config

RUN sed -i '/AuthorizedKeysFile/c\AuthorizedKeysFile      ~/.ssh/authorized_keys' /etc/ssh/sshd_config

#git

RUN git config --global init.defaultBranch main

RUN mkdir repo

#WORKDIR repo

RUN git init --bare
#RUN git init --shared=true

#start ssh server
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["ssh-keygen -A \
&& cat /etc/ssh/ssh_host_rsa_key.pub > /etc/ssh/ssh_host_rsa_key.pub.share \
&& /usr/sbin/sshd -D "]
