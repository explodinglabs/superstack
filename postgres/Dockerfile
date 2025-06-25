FROM postgres:17

# gettext is needed for envsubst
RUN apt-get update && apt-get install -y \
  gettext

COPY docker-entrypoint-initdb.d /docker-entrypoint-initdb.d
COPY migrations /etc/superstack/migrations
COPY bin /superstack-bin

ENV PATH="/superstack-bin:$PATH"
