FROM ppc64le/fedora:29

MAINTAINER wangyan@vmware.com

# The original script in the docker offical registry image.
RUN rm -rf /etc/yum.repos.d/* \
    && curl -o /etc/yum.repos.d/fedora.repo https://raw.githubusercontent.com/liupeng0518/goharbor/master/fedora.repo \
    && yum install sudo -y \
    && yum clean all \
    && mkdir /harbor/ \
    && mkdir -p /etc/registry \
    && groupadd -r -g 10000 harbor && useradd --no-log-init -r -g 10000 -u 10000 harbor  

COPY ./make/photon/common/install_cert.sh /harbor
COPY ./make/photon/registry/entrypoint.sh /
COPY ./make/photon/registry/binary/registry /usr/bin

RUN chmod u+x /entrypoint.sh \
    && chmod u+x /usr/bin/registry

HEALTHCHECK CMD curl 127.0.0.1:5000/

VOLUME ["/var/lib/registry"]
EXPOSE 5000
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/etc/registry/config.yml"]
