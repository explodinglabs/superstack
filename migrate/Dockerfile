FROM postgres:16-alpine

WORKDIR /migrations

COPY migrations ./migrations/
COPY bin /migrate-bin

ENTRYPOINT ["/migrate-bin/migrate.sh"]
