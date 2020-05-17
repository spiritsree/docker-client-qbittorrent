#!/bin/bash

DOCKERIZE_VERSION='0.6.1'

DOCKERIZE_IMAGE_URL="https://github.com/jwilder/dockerize/releases/download/v${DOCKERIZE_VERSION}/dockerize-linux-amd64-v${DOCKERIZE_VERSION}.tar.gz"
TMP_DIR="/opt/setup-dir"

mkdir -p /qbittorrent/webui/
mkdir -p "${TMP_DIR}"
pushd "${TMP_DIR}" > /dev/null || exit 1

# Installing dockerize
echo "**** install dockerize ****"
curl -sL "${DOCKERIZE_IMAGE_URL}" 2> /dev/null | tar -C /usr/local/bin -xz

popd > /dev/null || exit 1
rm -rf "${TMP_DIR}"
