FROM jwilder/nginx-proxy:alpine
#spécifique à nextcloud
COPY cloud/uploadsize.conf /etc/nginx/conf.d/uploadsize.conf