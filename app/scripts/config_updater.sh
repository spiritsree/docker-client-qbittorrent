#!/bin/bash

# export the variables so that this process can access them
# shellcheck disable=SC1091
source /usr/local/scripts/env.sh

if [[ -z "${QBITTORRENT_WEBUI_PORT-}" ]]; then
    echo "[CONFIG-UPDATER] Web UI port empty..." >> "${LOG_FILE}"
    exit 1
fi

API_BASE="http://localhost:${QBITTORRENT_WEBUI_PORT}"
API_URL="${API_BASE}/api/v2"
status=""

while [[ $(curl -s -k -o /dev/null -w "%{http_code}" --header "Referer: ${API_BASE}" "${API_BASE}") != "200" ]]; do
    sleep 1
done

echo "[CONFIG-UPDATER] Updating the config via api..." >> "${LOG_FILE}"
scan_dir_data="json={\"scan_dirs\":{\"${QBITTORRENT_WATCH_DIR}\":1}}"
web_ui_pass_data="json={\"web_ui_password\":\"${QBITTORRENT_WEBUI_PASSWORD}\"}"
auth_creds="username=${QBITTORRENT_WEBUI_USERNAME}&password=adminadmin"
echo "[CONFIG-UPDATER] Getting the auth cookie..." >> "${LOG_FILE}"
auth_cookie=$(curl -i -k -s --header "Referer: ${API_BASE}" --data "${auth_creds}" "${API_URL}/auth/login" 2> /dev/null | grep 'set-cookie' | awk '{ print $2 }' | sed 's/;$//')
echo "[CONFIG-UPDATER] Updating scan_dirs data..." >> "${LOG_FILE}"
status=$(curl -i -k -s -o /dev/null -w "%{http_code}" --header "Referer: ${API_BASE}" --data "${scan_dir_data}" "${API_URL}/app/setPreferences" --cookie "${auth_cookie}" 2> /dev/null)
if [[ "${status}" == "200" ]]; then
    echo "[CONFIG-UPDATER] scan_dirs data updated successfully..." >> "${LOG_FILE}"
    status=""
fi
echo "[CONFIG-UPDATER] Updating web ui password..." >> "${LOG_FILE}"
status=$(curl -i -k -s -o /dev/null -w "%{http_code}" --header "Referer: ${API_BASE}" --data "${web_ui_pass_data}" "${API_URL}/app/setPreferences" --cookie "${auth_cookie}" 2> /dev/null)
if [[ "${status}" == "200" ]]; then
    echo "[CONFIG-UPDATER] web ui password updated successfully..." >> "${LOG_FILE}"
    status=""
fi

echo "[CONFIG-UPDATER] Updating the config completed..." >> "${LOG_FILE}"
exit
