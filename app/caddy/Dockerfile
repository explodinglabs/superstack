FROM caddy:2

# curl is used for healthchecks
RUN apk add curl

# Copy our Caddyfile into the image
COPY Caddyfile /etc/caddy/Caddyfile
