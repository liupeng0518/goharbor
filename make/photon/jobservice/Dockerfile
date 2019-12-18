FROM ppc64le/fedora:29

RUN rm -rf /etc/yum.repos.d/* \
    && curl -o /etc/yum.repos.d/fedora.repo https://raw.githubusercontent.com/liupeng0518/goharbor/master/fedora.repo \
    && yum install sudo tzdata -y >> /dev/null \
    && yum clean all \
    && groupadd -r -g 10000 harbor && useradd --no-log-init -r -g 10000 -u 10000 harbor

COPY ./make/photon/jobservice/harbor_jobservice /harbor/

RUN chmod u+x /harbor/harbor_jobservice

WORKDIR /harbor/

USER harbor

VOLUME ["/var/log/jobs/"]

HEALTHCHECK CMD curl --fail -s http://127.0.0.1:8080/api/v1/stats || exit 1

ENTRYPOINT ["/harbor/harbor_jobservice", "-c", "/etc/jobservice/config.yml"]
