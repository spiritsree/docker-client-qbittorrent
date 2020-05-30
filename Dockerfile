FROM ubuntu:20.04

# Enable the non-interactive mode while installing apps
ARG DEBIAN_FRONTEND=noninteractive

ADD ./app/install /scripts

RUN echo "**** add repositories ****" \
    && apt-get update > /dev/null \
    && apt-get -y install --no-install-recommends apt-utils software-properties-common > /dev/null 2>&1 \
    && add-apt-repository ppa:qbittorrent-team/qbittorrent-stable > /dev/null \
    && apt-get update > /dev/null \
    && echo "**** install packages ****" \
    && apt-get -y upgrade > /dev/null \
    && apt-get -y install --no-install-recommends curl iputils-ping qbittorrent-nox > /dev/null \
    && apt-get -y install --no-install-recommends dumb-init > /dev/null \
    && bash /scripts/install-app.sh \
    && echo "**** cleanup ****" \
    #&& apt-get -y remove curl > /dev/null \
    #&& apt-get -y autoremove > /dev/null \
    && apt-get -y clean > /dev/null \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && useradd -u 1999 -U -s $(which nologin) qbittorrent

ADD ./app/config /etc/config
ADD ./app/scripts /usr/local/scripts

ENV HEALTH_CHECK_HOST=www.google.com \
    ENABLE_FILE_LOGGING=true \
    LOG_FILE=/data/application.log \
    QBITTORRENT_START_DELAY= \
    QBITTORRENT_RUNAS_ROOT=false \
    QBITTORRENT_SETTING_DEFAULT=false \
    QBITTORRENT_WATCH_DIR=/data/watch \
    QBITTORRENT_INCOMPLETE_DIR=/data/incomplete \
    QBITTORRENT_DOWNLOAD_DIR=/data/completed \
    QBITTORRENT_HOME=/data/qbittorrent-home \
    QBITTORRENT_WEB_UI= \
    QBITTORRENT_WEBUI_ADDRESS=0.0.0.0 \
    QBITTORRENT_WEBUI_PORT=8080 \
    QBITTORRENT_WEBUI_USERNAME=username \
    QBITTORRENT_WEBUI_PASSWORD=password \
    QBITTORRENT_CONNECTION_INTERFACEADDRESS=0.0.0.0 \
    QBITTORRENT_CONNECTION_PORT=6881 \
    QBITTORRENT_CONNECTION_PORT_RANDOM_HIGH=65535 \
    QBITTORRENT_CONNECTION_PORT_RANDOM_LOW=45535

VOLUME /data

HEALTHCHECK --interval=5m --timeout=15s --start-period=30s CMD /usr/local/scripts/health.sh

EXPOSE 8080

CMD ["dumb-init", "/usr/local/scripts/startClient.sh"]
