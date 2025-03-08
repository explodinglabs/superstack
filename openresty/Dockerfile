# This Dockerfile is for building the production app image with docs and conf
# included. For development we use the base image from dockerhub, because we're
# mounting these directories in.
# 
# Be sure to build with RESTY_DEB_FLAVOR="-debug" docker build ...
# The "-fat" image includes OPM.
FROM openresty/openresty:bookworm-fat

COPY docs /usr/local/openresty/nginx/html
COPY conf.d-prod /etc/nginx/conf.d
