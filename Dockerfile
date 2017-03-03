FROM ruby:2.4.0

RUN apt-get update
RUN apt-get install -y nginx
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

RUN mkdir /app
RUN mkdir /etc/nginx/locations
RUN mkdir /etc/nginx/servers

COPY nginx.conf /etc/nginx/nginx.conf
COPY servers /etc/nginx/servers/
COPY locations /etc/nginx/locations/

EXPOSE 80
ENTRYPOINT nginx
