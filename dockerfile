FROM jwilder/nginx-proxy:alpine as parent


#nextcloudConf----------
#nextcloud configuration upload
FROM parent as nextcloudConf
COPY cloud/uploadsize.conf /etc/nginx/conf.d/uploadsize.conf


#BASE----------
#interface pour l'image de base
FROM nextcloudConf as base
EXPOSE 80

#DEV----------
FROM base as dev

#PROD----------
FROM base as prod
EXPOSE 443
ENV VIRTUAL_PROTO=https
ENV ENABLE_IPV6=true