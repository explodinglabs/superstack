FROM postgres:13

RUN apt-get update
RUN apt-get install -y build-essential postgresql-server-dev-13

COPY ./pg_hashids /pg_hashids
WORKDIR /pg_hashids
RUN make
RUN make install

COPY ./pg_amqp /pg_amqp
WORKDIR /pg_amqp
RUN make
RUN make install

COPY ./pgjwt /pgjwt
WORKDIR /pgjwt
RUN make
RUN make install

COPY ./postgres.conf /var/lib/postgresql/data/postgresql.conf
COPY ./init-scripts /docker-entrypoint-initdb.d/init-scripts
