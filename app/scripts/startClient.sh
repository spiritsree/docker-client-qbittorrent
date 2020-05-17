#!/bin/bash

# shellcheck source=../scripts/functions.sh
# shellcheck disable=SC1091
source /usr/local/scripts/functions.sh

if [[ "${ENABLE_FILE_LOGGING}" == "false" ]]; then
    export LOG_FILE="/proc/self/fd/1"
else
    touch "${LOG_FILE}"
    chmod 666 "${LOG_FILE}"
fi

if [[ ! -d "${QBITTORRENT_HOME}" ]]; then
    mkdir -p "${QBITTORRENT_HOME}"
fi

export QBITTORRENT_CONFIG_PATH="${QBITTORRENT_HOME}/qBittorrent/config"

# Create a non privileged user if not root
if [[ "${QBITTORRENT_RUNAS_ROOT,,}" == "false" ]]; then
    export QBITTORRENT_USER='qbittorrent'
else
    export QBITTORRENT_USER='root'
fi
QBITTORRENT_UID=$(id -u "${QBITTORRENT_USER}")
QBITTORRENT_GID=$(id -g "${QBITTORRENT_USER}")
export QBITTORRENT_UID
export QBITTORRENT_GID

# Create the directories if not
echo "[QBITTORRENT] Setting up various directory permissions..." >> ${LOG_FILE}
{
    _create_dir_perm "/qbittorrent" "${QBITTORRENT_USER}";
    _create_dir_perm "${QBITTORRENT_HOME}" "${QBITTORRENT_USER}";
    _create_dir_perm "${QBITTORRENT_CONFIG_PATH}" "${QBITTORRENT_USER}";
    _create_dir_perm "${QBITTORRENT_HOME}/temp" "${QBITTORRENT_USER}";
    _create_dir_perm "${QBITTORRENT_HOME}/logs" "${QBITTORRENT_USER}";
    _create_dir_perm "${QBITTORRENT_HOME}/finished" "${QBITTORRENT_USER}";
    _create_dir_perm "${QBITTORRENT_HOME}/torrents" "${QBITTORRENT_USER}";
    _create_dir_perm "${QBITTORRENT_WATCH_DIR}" "${QBITTORRENT_USER}";
    _create_dir_perm "${QBITTORRENT_INCOMPLETE_DIR}" "${QBITTORRENT_USER}";
    _create_dir_perm "${QBITTORRENT_DOWNLOAD_DIR}" "${QBITTORRENT_USER}";
} >> ${LOG_FILE}

if [[ -f "${QBITTORRENT_CONFIG_PATH}/qBittorrent.conf" ]] && [[ "${QBITTORRENT_SETTING_DEFAULT,,}" == "false" ]]; then
    echo "[QBITTORRENT] qBittorrent will preserve the config..." >> ${LOG_FILE}
    _get_settings "qbittorrent" "${QBITTORRENT_CONFIG_PATH}/qBittorrent.conf"
else
    echo "[QBITTORRENT] qBittorrent will use default config..." >> ${LOG_FILE}
    dockerize -template "/etc/config/qBittorrent.conf.tmpl:/tmp/qBittorrent.conf"
    _get_settings "qbittorrent" "/tmp/qBittorrent.conf"
    rm "/tmp/qBittorrent.conf"
fi

# Peer port
if [[ "${QBITTORRENT_GENERAL_USERANDOMPORT,,}" == "true" ]]; then
    echo "[QBITTORRENT] qBittorrent will use random port for connection..." >> ${LOG_FILE}
    QBITTORRENT_CONNECTION_PORT=$(shuf -i "${QBITTORRENT_CONNECTION_PORT_RANDOM_LOW}-${QBITTORRENT_CONNECTION_PORT_RANDOM_HIGH}" -n 1)
    export QBITTORRENT_CONNECTION_PORT
    echo "[QBITTORRENT] selected random port is ${QBITTORRENT_CONNECTION_PORT}..." >> ${LOG_FILE}
fi

# Proxy
if [[ "${QBITTORRENT_CONNECTION_PROXYTYPE-}" == "5" ]]; then
    export QBITTORRENT_CONNECTION_PROXYONLYFORTORRENTS="true"
fi

# qBittorrent custom UI
if [[ -z "${QBITTORRENT_WEB_UI-}" ]]; then
    echo "[QBITTORRENT] Using the built-in Web UI" >> ${LOG_FILE}
    export QBITTORRENT_WEB_UI="default"
    export QBITTORRENT_WEB_HOME="/qbittorrent/webui/default"
else
    echo "[QBITTORRENT] Using the custom Web UI" >> ${LOG_FILE}
    #export QBITTORRENT_WEB_HOME="/qbittorrent/custom"
    #export QBITTORRENT_WEBUI_ALTERNATIVEUIENABLED=true
    #export QBITTORRENT_WEBUI_ROOTFOLDER="${QBITTORRENT_WEB_HOME}"
fi

env | grep 'QBITTORRENT' | grep -v '(' | sed 's/^/export /g' >> /usr/local/scripts/env.sh
env | grep 'LOG' | sed 's/^/export /g' >> /usr/local/scripts/env.sh

dockerize -template "/etc/config/qBittorrent.conf.tmpl:${QBITTORRENT_CONFIG_PATH}/qBittorrent.conf"

# start the config updater
exec /usr/local/scripts/config_updater.sh &

echo "[QBITTORRENT] qBittorrent will run as \"${QBITTORRENT_USER}\" with UID \"${QBITTORRENT_UID}\" and GID \"${QBITTORRENT_GID}\"" >> ${LOG_FILE}
exec su -p "${QBITTORRENT_USER}" -s /bin/bash -c "qbittorrent-nox --profile=${QBITTORRENT_HOME}"
