# Build a custom Iko image with your migrations included. Useful for deploying
# migrations on other environments. See the wiki page on Deploying to targets.
FROM ghcr.io/explodinglabs/iko:0.1.0

COPY migrations /repo
