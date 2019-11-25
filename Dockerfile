FROM httpd:latest

COPY httpd.conf /usr/local/apache2/conf/httpd.conf
RUN mkdir -p /usr/local/apache2/conf/sites/
RUN echo "127.0.0.1 war.marist.ai" >> /etc/hosts

EXPOSE 80
CMD ["httpd", "-D", "FOREGROUND"]
