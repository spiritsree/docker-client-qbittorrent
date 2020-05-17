# Usage

The docker image can be run with the following command.

## Docker Run

```
docker run -d \
        --sysctl net.ipv6.conf.all.disable_ipv6=0 \
        --dns 8.8.8.8 --dns 8.8.4.4 \
        -v <local-dir>:/data \
        -p 8080:8080 \
        spiritsree/docker-client-qbittorrent:latest
```

The local dir is mounted so that you can access the files from your host machine also to keep the state of the previous run.

**Note:** You should share the dir with docker for the mount to work.


## Docker Compose Way

Instead of running this docker standalone you can pair it with the VPN container, so that traffic will go through the VPN connection.

Refer [docker-compose-qbittorrent.yml](https://github.com/spiritsree/docker-torrent-client/blob/master/docker-compose-qbittorrent.yml)

```yaml
# supported docker-compose version 1.25.5
version: "3.8"
services:
  vpn-client:
    container_name: docker_torrent_client
    image: spiritsree/docker-torrent-client:latest-alpine
    cap_add:
      - NET_ADMIN
    ports:
      - "9091:9091"
      - "8080:8080"
    dns:
      - 8.8.8.8
      - 1.1.1.1
    volumes:
      - /local/data:/data
    sysctls:
      - net.ipv6.conf.all.disable_ipv6=0
    environment:
      OPENVPN_PROVIDER: ''
      OPENVPN_CONNECTION: ''
      OPENVPN_USERNAME: ''
      OPENVPN_PASSWORD: ''
      TOR_CLIENT_ENABLED: 'false'
      LOCAL_NETWORK: 192.168.1.0/24
    restart: on-failure
    # Below are only for swarm deploy. Ignored for docker-compose up
    deploy:
      replicas: 1
      restart_policy:
        condition: on-failure
        delay: 5s
        max_attempts: 3

  qbittorrent_container:
    container_name: qbittorrent_container
    image: docker-client-qbittorrent:latest
    volumes:
      - /local/data:/data
    sysctls:
      - net.ipv6.conf.all.disable_ipv6=0
    network_mode: "service:vpn-client"
    depends_on:
      - vpn-client
```

Update the config values and run it as

```
$ docker-compose -f docker-compose-qbittorrent.yml up
```

or as daemon

```
$ docker-compose -f docker-compose-qbittorrent.yml up -d
```

This will start both VPN docker and the qbittorrent docker in a single docker network, so that they both can communicate.

The port, DNS etc are configured in the main container `vpn-client`.

You an still access the UI with the same url.

```
http://<local-ip>:8080
```
