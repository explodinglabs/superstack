FROM postgres:17

RUN apt-get update
RUN apt-get install -y gettext

COPY bin /superstack-bin
ENV PATH="/superstack-bin:$PATH"
