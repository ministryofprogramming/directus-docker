#!/bin/sh

PARAMS=$@
VALUES=""

# List all API endpoints
entries=$(env | grep API_ENDPOINT)

# Parse and normalize entries
HAS_ENDPOINTS=0
IFS=$'\n';
for entry in $entries
do
    IFS='='
    set -- $entry
    KEY=$1
    VALUE=$2
    IFS=';'
    set -- $VALUE
    NAME=$(echo "$1" | tr -d '"' | tr -d '\' | sed -e 's/^[[:space:]]*//' | sed -e 's/[[:space:]]*$//')
    LINK=$(echo "$2" | tr -d '"' | tr -d '\' | sed -e 's/^[[:space:]]*//' | sed -e 's/[[:space:]]*$//')
    VALUES=$VALUES"      \"$LINK\": \"$NAME\",\n"
    IFS=$'\n';
    HAS_ENDPOINTS=1
done

# Escape for sed and valid JS for IE
VALUES=$(echo "$VALUES" | sed 's/#/\\#/g' | head -c-4)
ROUTER_BASE_URL=$(echo "${ROUTER_BASE_URL:-/}" | sed 's#/#\\/#g')

# Replace variables
cat /directus/config.js | \
sed -e 's#      \"../_/\": \"Directus Demo API\"#'$VALUES'#g' | \
sed -e 's/allowOtherAPI: false/allowOtherAPI: '${ALLOW_OTHER_API:-false}'/g' | \
sed -e 's/routerBaseUrl: "\/"/routerBaseUrl: "'${ROUTER_BASE_URL}'"/g' | \
sed -e 's/routerMode: "hash"/routerMode: "'${ROUTER_MODE:-hash}'"/g' > /usr/share/nginx/html/config.js

# Start nginx
exec nginx -g "daemon off;"
