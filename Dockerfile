FROM openresty/openresty:1.13.6.2-1-alpine-fat

RUN mkdir -p /etc/nginx/conf.d
RUN luarocks install net-url 
RUN opm get jkeys089/lua-resty-hmac 
RUN echo "env HMAC_SIGNING_KEY;" >> /usr/local/openresty/nginx/conf/nginx.conf
RUN echo "env HMAC_PROXY_BASE_URL;" >> /usr/local/openresty/nginx/conf/nginx.conf

COPY hmac-proxy.conf /etc/nginx/conf.d/default.conf

