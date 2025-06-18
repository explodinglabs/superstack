# Build a custom Iko image with your migrations included. Use this to
# deploy migrations to other environments.
FROM ghcr.io/explodinglabs/iko:0.1.0

COPY migrations /repo
COPY scripts /scripts

# COPY bin /superstack-bin
# ENV PATH="/superstack-bin:$PATH"
