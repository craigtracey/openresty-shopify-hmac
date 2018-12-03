#!/bin/bash

set -e

envsubst '$$HMAC_LISTEN $$HMAC_SIGNING_KEY $$HMAC_PROXY_BASE_URL $$HMAC_FILE_WHITELIST' < /etc/nginx/conf.d/default.conf.tmpl > /etc/nginx/conf.d/default.conf
/usr/local/openresty/bin/openresty -g 'daemon off;'
