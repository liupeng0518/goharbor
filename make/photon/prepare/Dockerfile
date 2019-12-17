FROM ppc64le/fedora:26

ENV LANG en_US.UTF-8

WORKDIR /usr/src/app

RUN mkdir -p /harbor_make

RUN set -x \
    && dnf install -y python3 python3-pip which
RUN pip3 install pipenv==2018.11.26

COPY make/photon/prepare /usr/src/app
RUN set -ex && pipenv lock && pipenv install --deploy --system

ENTRYPOINT [ "python3", "main.py" ]

VOLUME ["/harbor_make"]
