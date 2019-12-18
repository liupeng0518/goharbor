FROM ppc64le/fedora:29

ENV LANG en_US.UTF-8

WORKDIR /usr/src/app

RUN mkdir -p /harbor_make

RUN rm -rf /etc/yum.repos.d/* \
    && curl -o /etc/yum.repos.d/fedora.repo https://raw.githubusercontent.com/liupeng0518/goharbor/master/fedora.repo \
    && yum install -y python3 python3-pip which \
    && dnf clean all

RUN pip3 install pipenv==2018.11.26

COPY make/photon/prepare /usr/src/app
RUN set -ex && pipenv install --deploy --system

ENTRYPOINT [ "python3", "main.py" ]

VOLUME ["/harbor_make"]
