FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt install -y \
        nano \
	nginx \
	python3-certbot-nginx 

COPY /conf.d/rev-ser/*.conf /etc/nginx/conf.d/
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80/tcp
EXPOSE 80/udp
EXPOSE 443/tcp
EXPOSE 443/udp

ENTRYPOINT ["nginx"]

CMD ["-g","daemon off;"]
