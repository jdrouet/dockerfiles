ARG ARCH
ARG POSTGRES_VERSION=9.6

FROM ${ARCH}postgres:${POSTGRES_VERSION}

LABEL org.opencontainers.image.authors="Jeremie Drouet <jeremie.drouet@gmail.com>" \
	org.opencontainers.image.title="PostgreSQL+PostGIS" \
	org.opencontainers.image.description="PostgreSQL and PostGIS on multi arch" \
	org.opencontainers.image.licenses="MIT" \
	org.opencontainers.image.url="https://hub.docker.com/r/jdrouet/postgis" \
	org.opencontainers.image.source="https://github.com/jdrouet/dockerfiles"

ARG POSTGRES_VERSION=9.6
ARG POSTGIS_VERSION=2.3

RUN apt-get update -y \
  && apt-get install -y --no-install-recommends \
		postgresql-${POSTGRES_VERSION}-postgis-${POSTGIS_VERSION} \
		postgresql-${POSTGRES_VERSION}-postgis-${POSTGIS_VERSION}-scripts \
  && rm -rf /var/lib/apt/lists/*

ENV POSTGIS_VERSION=${POSTGIS_VERSION}

RUN mkdir -p /docker-entrypoint-initdb.d
COPY ./initdb-postgis.sh /docker-entrypoint-initdb.d/postgis.sh
COPY ./update-postgis.sh /usr/local/bin/update-postgis.sh

RUN chmod +x /docker-entrypoint-initdb.d/postgis.sh \
  && chmod +x /usr/local/bin/update-postgis.sh
