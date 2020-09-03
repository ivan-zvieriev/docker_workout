FROM ubuntu:18.04
LABEL maintainer="Ivan Zvieriev"
LABEL version="1.0.2"
RUN apt-get update;apt-get install -y nginx
RUN echo 'Hi, I am in your container' > /var/www/html/index.html
RUN echo 'New line' >> /var/www/html/index.html
EXPOSE 80
