FROM ppc64le/fedora:29

MAINTAINER wangyan@vmware.com

RUN rm -rf /etc/yum.repos.d/* \
    && curl -o /etc/yum.repos.d/fedora.repo https://raw.githubusercontent.com/liupeng0518/goharbor/master/fedora.repo \
    && yum install sudo -y >> /dev/null \
    && yum clean all \
    && groupadd -r -g 10000 harbor && useradd --no-log-init -r -g 10000 -u 10000 harbor \
    && mkdir -p /etc/registry \
    && mkdir /harbor/

COPY ./make/photon/common/install_cert.sh /harbor
COPY ./make/photon/registry/binary/registry /usr/bin
COPY ./make/photon/registryctl/start.sh /harbor/
COPY ./make/photon/registryctl/harbor_registryctl /harbor/

RUN chmod u+x /harbor/harbor_registryctl \
    && chmod u+x /usr/bin/registry \
    && chmod u+x /harbor/start.sh

HEALTHCHECK CMD curl --fail -s http://127.0.0.1:8080/api/health || exit 1 

VOLUME ["/var/lib/registry"]
WORKDIR /harbor/

ENTRYPOINT ["/harbor/start.sh"]
