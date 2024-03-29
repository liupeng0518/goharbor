FROM ppc64le/fedora:29

ENV PGDATA /var/lib/postgresql/data
RUN rm -rf /etc/yum.repos.d/* \
    && curl -o /etc/yum.repos.d/fedora.repo https://raw.githubusercontent.com/liupeng0518/goharbor/master/fedora.repo \
    && yum install -y gzip postgresql postgresql-server >> /dev/null\
    && mkdir -p /docker-entrypoint-initdb.d \
    && mkdir -p /run/postgresql \
    && chown -R postgres:postgres /run/postgresql \
    && chmod 2777 /run/postgresql \
    && mkdir -p "$PGDATA" && chown -R postgres:postgres "$PGDATA" && chmod 777 "$PGDATA" \
    && sed -i "s|#listen_addresses = 'localhost'.*|listen_addresses = '*'|g" /usr/share/pgsql/postgresql.conf.sample \
    && sed -i "s|#unix_socket_directories = '/tmp'.*|unix_socket_directories = '/run/postgresql'|g" /usr/share/pgsql/postgresql.conf.sample \
    && yum clean all

RUN dnf clean all \
    && yum install -y util-linux net-tools

VOLUME /var/lib/postgresql/data

COPY ./make/photon/db/docker-entrypoint.sh /docker-entrypoint.sh
COPY ./make/photon/db/docker-healthcheck.sh /docker-healthcheck.sh
COPY ./make/photon/db/initial-notaryserver.sql /docker-entrypoint-initdb.d/
COPY ./make/photon/db/initial-notarysigner.sql /docker-entrypoint-initdb.d/
COPY ./make/photon/db/initial-registry.sql /docker-entrypoint-initdb.d/
RUN chown -R postgres:postgres /docker-entrypoint.sh /docker-healthcheck.sh /docker-entrypoint-initdb.d \
    && chmod u+x /docker-entrypoint.sh /docker-healthcheck.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
HEALTHCHECK CMD ["/docker-healthcheck.sh"]

EXPOSE 5432
USER postgres
