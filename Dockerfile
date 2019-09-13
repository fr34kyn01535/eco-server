FROM docker.pkg.github.com/fr34kyn01535/eco-server/base-image:latest

WORKDIR /srv/eco-server
EXPOSE 2999/udp 2999 3000 3001

CMD ["/srv/eco-server/start.sh"]

ADD install.sh ./
ADD start.sh ./

RUN /srv/eco-server/install.sh
