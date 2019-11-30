FROM nginx
MAINTAINER Daniel Gisolfi
RUN apt-get update -y

COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./ssl/privkey.pem /etc/nginx/ssl/nginx.key
COPY ./ssl/fullchain.pem /etc/nginx/ssl/nginx.pem
 
EXPOSE 80
