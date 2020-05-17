# Docker qbittorrent client

[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/spiritsree/docker-client-qbittorrent)](https://hub.docker.com/r/spiritsree/docker-client-qbittorrent)
[![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/spiritsree/docker-client-qbittorrent)](https://hub.docker.com/r/spiritsree/docker-client-qbittorrent)
[![Docker Pulls](https://img.shields.io/docker/pulls/spiritsree/docker-client-qbittorrent)](https://hub.docker.com/r/spiritsree/docker-client-qbittorrent/tags)
[![Docker Stars](https://img.shields.io/docker/stars/spiritsree/docker-client-qbittorrent)](https://hub.docker.com/r/spiritsree/docker-client-qbittorrent)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/v/tag/spiritsree/docker-client-qbittorrent?sort=semver)](https://hub.docker.com/r/spiritsree/docker-client-qbittorrent)
[![License](https://img.shields.io/github/license/spiritsree/docker-client-qbittorrent)](https://github.com/spiritsree/docker-client-qbittorrent/blob/master/LICENSE.md)

A configurable qbittorrent docker client based out of Ubuntu image


## Quick Start

You can run this by just running the following

```
docker run -d \
        --sysctl net.ipv6.conf.all.disable_ipv6=0 \
        --dns 8.8.8.8 --dns 8.8.4.4 \
        -v <local-dir>:/data \
        -p 8080:8080 \
        spiritsree/docker-client-qbittorrent:latest
```

For detailed usage and to pair it with VPN container please refer [Usage](./docs/usage.md).

## Accessing the UI

Just put this in browser `http://<local-ip>:8080`.

For more details visit [Accessing the UI](./docs/web-ui.md).

## Documentation

* [Usage](./docs/usage.md)
* [Supported Environment Variables](./docs/env.md)
* [qBittorrent](https://github.com/qbittorrent/qBittorrent/wiki)
* [qBittorrent Config](https://github.com/qbittorrent/qBittorrent/wiki/Explanation-of-Options-in-qBittorrent)
* [qBittorrent API Doc](https://github.com/qbittorrent/qBittorrent/wiki/Web-API-Documentation)
* [Accessing the UI](./doc/web-ui.md)
* [Docker Options](https://github.com/spiritsree/docker-torrent-client/blob/master/doc/docker.md)
* [Debugging](https://github.com/spiritsree/docker-torrent-client/blob/master/doc/debug.md)
* [Container Networking](https://github.com/spiritsree/docker-torrent-client/blob/master/doc/networking.md)
* [Reference](https://www.libtorrent.org/reference.html)

## LICENSE

GPL-v3.0

