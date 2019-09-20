FROM alpine:3.10

RUN apk add --no-cache --update nginx
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

RUN mkdir /app
RUN mkdir /etc/nginx/locations
RUN mkdir /etc/nginx/servers

COPY nginx.conf /etc/nginx/nginx.conf
COPY servers /etc/nginx/servers/
COPY locations /etc/nginx/locations/

COPY scripts/ /

EXPOSE 80
ENTRYPOINT ["/entrypoint"]
