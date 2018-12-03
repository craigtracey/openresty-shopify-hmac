FROM openresty/openresty:1.13.6.2-1-alpine-fat

RUN apk update && apk add gettext
RUN mkdir -p /etc/nginx/conf.d
RUN luarocks install net-url 
RUN opm get jkeys089/lua-resty-hmac 

COPY hmac-proxy.conf /etc/nginx/conf.d/default.conf.tmpl
COPY start.sh /

ENV HMAC_LISTEN=8080

CMD ["/start.sh"]
