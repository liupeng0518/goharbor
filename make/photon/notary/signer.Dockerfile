FROM ppc64le/fedora:29

RUN yum install -y  sudo \
    && yum clean all \
    && groupadd -r -g 10000 notary \
    && useradd --no-log-init -r -g 10000 -u 10000 notary
COPY ./make/photon/notary/migrate-patch /bin/migrate-patch
COPY ./make/photon/notary/binary/notary-signer /bin/notary-signer
COPY ./make/photon/notary/binary/migrate /bin/migrate
COPY ./make/photon/notary/binary/migrations/ /migrations/

RUN chmod +x /bin/notary-signer /migrations/migrate.sh /bin/migrate /bin/migrate-patch
ENV SERVICE_NAME=notary_signer
USER notary
CMD migrate-patch -database=${DB_URL} && /migrations/migrate.sh && /bin/notary-signer -config=/etc/notary/signer-config.postgres.json -logf=logfmt
