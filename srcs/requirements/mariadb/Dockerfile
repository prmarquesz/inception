FROM alpine:3.17

RUN apk update && apk add --no-cache mariadb mariadb-client

COPY conf/setup.sh /tmp/setup.sh

COPY conf/dump.sql /tmp/dump.sql

RUN chmod u+x /tmp/setup.sh

EXPOSE 3306

ENTRYPOINT [ "sh", "/tmp/setup.sh" ]