FROM postgres:17

RUN apt-get update
RUN apt-get install -y gettext

COPY postgres/docker-entrypoint-initdb.d /docker-entrypoint-initdb.d
COPY postgres/migrations /etc/superstack/migrations
COPY bin /superstack-bin

ENV PATH="/superstack-bin:$PATH"
