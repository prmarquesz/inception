FROM alpine:3.17

ARG DOMAIN_NAME

WORKDIR /var/www/wordpress

RUN mkdir -p /etc/nginx/snippets /etc/ssl/private; \
    apk update && apk add --no-cache nginx openssl; \
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -subj "/C=BR/ST=SP/L=Sao Paulo/CN=*.${DOMAIN_NAME}" \
	-addext "subjectAltName=DNS:*.${DOMAIN_NAME}" \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt

COPY conf/nginx.conf /etc/nginx/http.d/default.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]