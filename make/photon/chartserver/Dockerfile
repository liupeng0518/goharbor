FROM ppc64le/fedora:29

RUN rm -rf /etc/yum.repos.d/* \
    && curl -o /etc/yum.repos.d/fedora.repo https://raw.githubusercontent.com/liupeng0518/goharbor/master/fedora.repo \
    && yum install -y  sudo >>/dev/null\
    && yum clean all \
    && mkdir /chartserver/ \
    && mkdir /harbor/ \
    && groupadd -r -g 10000 chartuser \
    && useradd --no-log-init -m -r -g 10000 -u 10000 chartuser
COPY ./make/photon/chartserver/binary/chartm /chartserver/
COPY ./make/photon/chartserver/docker-entrypoint.sh /docker-entrypoint.sh
COPY ./make/photon/common/install_cert.sh /harbor

VOLUME ["/chart_storage"]
EXPOSE 9999

RUN chown -R 10000:10000 /chartserver \
    && chmod u+x /chartserver/chartm \
    && chmod u+x /docker-entrypoint.sh

HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD curl -sS 127.0.0.1:9999/health || exit 1

ENTRYPOINT ["/docker-entrypoint.sh"]
