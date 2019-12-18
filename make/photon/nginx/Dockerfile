FROM ppc64le/fedora:29

RUN rm -rf /etc/yum.repos.d/* \
    && curl -o /etc/yum.repos.d/fedora.repo https://raw.githubusercontent.com/liupeng0518/goharbor/master/fedora.repo \
    && yum install sudo nginx -y >> /dev/null\
    && yum clean all \
    && groupadd -r -g 10000 nginx && useradd --no-log-init -r -g 10000 -u 10000 nginx \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

VOLUME /var/cache/nginx /var/log/nginx /run

EXPOSE 8080

STOPSIGNAL SIGQUIT

HEALTHCHECK CMD curl --fail -s http://127.0.0.1:8080 || exit 1

USER nginx

CMD ["nginx", "-g", "daemon off;"]
