FROM ppc64le/fedora:29
RUN rm -rf /etc/yum.repos.d/* \
    && curl -o /etc/yum.repos.d/fedora.repo https://raw.githubusercontent.com/liupeng0518/goharbor/master/fedora.repo \
    && yum install sudo tzdata -y >> /dev/null \
    && yum clean all \
    && groupadd -r -g 10000 harbor && useradd --no-log-init -r -g 10000 -u 10000 harbor \
    && mkdir /harbor/

HEALTHCHECK CMD curl --fail -s http://127.0.0.1:8080/api/ping || exit 1
COPY ./make/photon/core/harbor_core ./UIVERSION /harbor/
COPY ./src/core/views /harbor/views
COPY ./make/migrations /harbor/migrations

RUN chmod u+x /harbor/harbor_core
WORKDIR /harbor/
USER harbor
ENTRYPOINT ["/harbor/harbor_core"]
