#!/bin/bash

set -e

export HMAC_PROXY_READ_TIMEOUT="${HMAC_PROXY_READ_TIMEOUT:-60s}"
export HMAC_PROXY_SEND_TIMEOUT="${HMAC_PROXY_SEND_TIMEOUT:-60s}"

envsubst '$$HMAC_LISTEN $$HMAC_SIGNING_KEY $$HMAC_PROXY_BASE_URL $$HMAC_FILE_WHITELIST $$HMAC_PROXY_READ_TIMEOUT $$HMAC_PROXY_SEND_TIMEOUT' < /etc/nginx/conf.d/default.conf.tmpl > /etc/nginx/conf.d/default.conf
/usr/local/openresty/bin/openresty -g 'daemon off;'
