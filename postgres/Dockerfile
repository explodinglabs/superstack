FROM postgres:17

COPY docker-entrypoint-initdb.d /docker-entrypoint-initdb.d
COPY migrations /etc/superstack/migrations
COPY bin /superstack-bin
ENV PATH="/superstack-bin:$PATH"

# gettext is needed for envsubst
RUN apt-get update && apt-get install -y \
  gettext

# Lastly, set the WORKDIR - This is the default anyway but it may be changed
# above by the user when installing extensions
WORKDIR /var/lib/postgresql
