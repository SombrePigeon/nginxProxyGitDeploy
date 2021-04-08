FROM jkarlos/git-server-docker

RUN apk add docker docker-compose

RUN git init --shared=true

ADD post-receive .

RUN chmod +x post-receive