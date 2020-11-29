FROM ubuntu AS git-puller

ARG fgapiserver_url=https://github.com/tzok/fgAPIServer
ARG fgapiserver_branch=master

ARG apiserverdaemon_url=https://github.com/tzok/APIServerDaemon.git
ARG apiserverdaemon_branch=develop

ARG grid_and_cloud_engine_url=https://github.com/tzok/grid-and-cloud-engine.git
ARG grid_and_cloud_engine_branch=FutureGateway

COPY files/apiserverdaemon.patch /
COPY files/fgapiserver.patch /

RUN apt-get update -y \
    && apt-get install -y \
        git \
        patch

RUN git clone -b ${fgapiserver_branch} ${fgapiserver_url} fgapiserver \
    && git clone -b ${apiserverdaemon_branch} ${apiserverdaemon_url} apiserverdaemon \
    && git clone -b ${grid_and_cloud_engine_branch} ${grid_and_cloud_engine_url}

RUN cd /apiserverdaemon \
    && patch -p0 < /apiserverdaemon.patch \
    && cd /fgapiserver \
    && patch -p0 < /fgapiserver.patch

################################################################################

FROM maven AS war-builder

COPY --from=git-puller /grid-and-cloud-engine /grid-and-cloud-engine
COPY --from=git-puller /apiserverdaemon /apiserverdaemon

RUN cd /grid-and-cloud-engine \
    && mvn install \
    && cd /apiserverdaemon \
    && mvn package

################################################################################

FROM mariadb AS fgdb

COPY --from=git-puller /fgapiserver/fgapiserver_db.sql /docker-entrypoint-initdb.d/
COPY --from=git-puller /fgapiserver/fgapiserver_dbusr8.sql /docker-entrypoint-initdb.d/

ENV MYSQL_RANDOM_ROOT_PASSWORD=yes

EXPOSE 3306/tcp

################################################################################

FROM tomcat AS apiserverdaemon

COPY --from=war-builder /apiserverdaemon/target/apiserverdaemon-0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
COPY files/apiserverdaemon.sh /apiserverdaemon.sh

EXPOSE 8080/tcp

CMD ["/apiserverdaemon.sh"]

################################################################################

FROM ubuntu AS fgapiserver

ENV DEBIAN_FRONTEND=noninteractive

COPY --from=git-puller /fgapiserver /var/www/fgapiserver
COPY files/fgapiserver.sh /
COPY files/wsgi.conf /etc/apache2/conf-available/

RUN apt-get update -y \
    && apt-get install -y \
        apache2 \
        apache2-utils \
        curl \
        gcc \
        libapache2-mod-wsgi \
        libpython2-dev \
        python \
    && rm -rf /var/lib/apt/lists \
    && a2enconf wsgi

RUN curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py \
    && python get-pip.py \
    && cd /var/www/fgapiserver \
    && pip install -r requirements.txt

CMD ["/fgapiserver.sh"]

EXPOSE 80/tcp
