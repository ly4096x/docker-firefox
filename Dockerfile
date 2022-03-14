FROM alpine

RUN apk update && apk upgrade && \
    apk add firefox xvfb x11vnc fluxbox unclutter-xfixes autocutsel && \
    apk search -qe 'font-noto-*' |xargs apk add && \
    mkdir /root/.profile-vol && \
    ln -s .profile-vol/mozilla /root/.mozilla && \
    mkdir /root/.fluxbox && \
    ln -s ../.profile-vol/fluxbox_startup /root/.fluxbox/startup && \
    rm -rf /var/cache/apk/*
ADD start.sh /

VOLUME ["/root/.profile-vol"]
ENTRYPOINT ["/bin/sh", "start.sh"]
