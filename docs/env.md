# Environment Variable Used

There are many environment variable which can be passed to the docker to customize the config and other parameters.

## General

Variable | Description | Default |
:--------|:------------|:--------|
`LOG_FILE` | The log file path | `/data/application.log` |
`ENABLE_FILE_LOGGING` | `true` enables logging to file, `false` will use docker logs | `true` |
`HEALTH_CHECK_HOST` | Docker health check host | `www.google.com` |

## qBittorrent

All these are set in the config directly with default during the intial run. If you set these ENV during the docker run, those settings will have the precedence. If not set, the value will get constructed from the config file (if previous config exists).

Refer [qBittorrent Options](https://github.com/qbittorrent/qBittorrent/wiki/Explanation-of-Options-in-qBittorrent) for detailed explanation.

**General**

Variable | Description | Default |
:--------|:------------|:--------|
`QBITTORRENT_RUNAS_ROOT` | Run qBittorrent client as root user | `false` |
`QBITTORRENT_SETTING_DEFAULT` | Use the default config | `false` |
`QBITTORRENT_HOME` | qBittorrent Home | `/data/qbittorrent-home` |
`QBITTORRENT_START_DELAY` | Start delay in seconds | |

**Downloads**

Variable | Description | Default |
:--------|:------------|:--------|
`QBITTORRENT_SESSION_CREATETORRENTSUBFOLDER` | Create subfolder for torrents with multiple files when adding a torrent | `true` |
`QBITTORRENT_DOWNLOADS_STARTINPAUSE` | Do not start the download automatically when adding a torrent | `false` |
`QBITTORRENT_AUTODELETEADDEDTORRENTFILE` | Delete .torrent files afterwards (`Never` or `IfAdded`) | `Never` |
`QBITTORRENT_DOWNLOADS_PREALLOCATION` | Pre-allocate disk space for all files | `false` |
`QBITTORRENT_DOWNLOADS_USEINCOMPLETEEXTENSION` | Append .!qB extension to incomplete files | `false` |
`QBITTORRENT_SESSION_DISABLEAUTOTMMBYDEFAULT` | Enable manual torrent management mode | `true` |
`QBITTORRENT_SESSION_DISABLEAUTOTMMTRIGGERSCATEGORYCHANGED` | Disable auto relocate when torrent category changed | `true` |
`QBITTORRENT_SESSION_DISABLEAUTOTMMTRIGGERS_DEFAULTSAVEPATHCHANGED` | Disable auto relocate when default save path changed | `true` |
`QBITTORRENT_SESSION_DISABLEAUTOTMMTRIGGERS_CATEGORYSAVEPATHCHANGED` | Disable auto relocate when category save path changed | `true` |
`QBITTORRENT_DOWNLOAD_DIR` | Directory for completed torrents | `/data/completed` |
`QBITTORRENT_INCOMPLETE_DIR` | Directory for ongoing torrents | `/data/incomplete` |
`QBITTORRENT_WATCH_DIR` | Directory to watch for torrent files and add them to torrent client | `/data/watch` |
`QBITTORRENT_DOWNLOADS_TEMPPATHENABLED` | Enable incomplete directory | `true` |
`QBITTORRENT_MAILNOTIFICATION_ENABLED` | Email notification upon download completion | `false` |
`QBITTORRENT_MAILNOTIFICATION_SENDER` | Sender address if `QBITTORRENT_MAILNOTIFICATION_ENABLED` is `true` | `qBittorrent_notification@example.com` |
`QBITTORRENT_MAILNOTIFICATION_EMAIL` | To address if `QBITTORRENT_MAILNOTIFICATION_ENABLED` is `true` | |
`QBITTORRENT_MAILNOTIFICATION_SMTP_SERVER` | SMTP Server for sending mail | `smtp.changeme.com` |
`QBITTORRENT_MAILNOTIFICATION_REQ_AUTH` | Enable SMTP authentication | `true` |
`QBITTORRENT_MAILNOTIFICATION_REQ_SSL` | Server requires secure connection (SSL) | `false` |
`QBITTORRENT_MAILNOTIFICATION_USERNAME` | SMTP username | |
`QBITTORRENT_MAILNOTIFICATION_PASSWORD` | SMTP Password | |
`QBITTORRENT_ENABLED` | Run external program on torrent completion | `false` |
`QBITTORRENT_PROGRAM` | Program to run | |

**Connection**

Variable | Description | Default |
:--------|:------------|:--------|
`QBITTORRENT_SESSION_BTPROTOCOL` | bittorrent protocol `TCP`, `UTP` or `Both` | `Both` |
`QBITTORRENT_CONNECTION_PORT` | Port used for incoming connections | `6881` |
`QBITTORRENT_CONNECTION_PORT_RANDOM_LOW` | Lower value in random port range to use if `QBITTORRENT_GENERAL_USERANDOMPORT` is `true` | `45535` |
`QBITTORRENT_CONNECTION_PORT_RANDOM_HIGH` | Upper value in random port range to use if `QBITTORRENT_GENERAL_USERANDOMPORT` is `true` | `65535` |
`QBITTORRENT_CONNECTION_USEUPNP` | Use UPnP / NAT-PMP port forwarding | `true` |
`QBITTORRENT_GENERAL_USERANDOMPORT` | Use different port on each startup | `false` |
`QBITTORRENT_BITTORRENT_MAXCONNECS` | Global maximum number of connections. `-1` to disable | `500` |
`QBITTORRENT_BITTORRENT_MAXCONNECSPERTORRENT` | Maximum number of connections per torrent. `-1` to disable | `100` |
`QBITTORRENT_BITTORRENT_MAXUPLOADS` | Global maximum number of upload slots. `-1` to disable | `8` |
`QBITTORRENT_BITTORRENT_MAXUPLOADSPERTORRENT` | Maximum number of upload slots per torrent. `-1` to disable | `4` |
`QBITTORRENT_CONNECTION_PROXYTYPE` | Proxy Server Type `0` - None, `1` - HTTP, `2` - SOCKS5, `3` - HTTP with Auth, `5` - SOCKS4 | `0` |
`QBITTORRENT_CONNECTION_PROXY_IP` | Proxy Server Host | `0.0.0.0` |
`QBITTORRENT_CONNECTION_PROXY_PORT` | Proxy Server Port | `8080` |
`QBITTORRENT_CONNECTION_PROXYPEERCONNECTIONS` | Use proxy for peer connections | `false` |
`QBITTORRENT_CONNECTION_PROXYONLYFORTORRENTS` | Use proxy only for torrents | `false` |
`QBITTORRENT_CONNECTION_PROXY_USERNAME` | Proxy username | |
`QBITTORRENT_CONNECTION_PROXY_PASSWORD` | Proxy password | |
`QBITTORRENT_IPFILTER_BANNEDIPS` | IP filtering manually banned IPs (comma separated) | |
`QBITTORRENT_IPFILTER_ENABLED` | IP filtering enabled | `false` |
`QBITTORRENT_IPFILTER_FILTERTRACKER` | Apply ip filtering to trackers | `false` |
`QBITTORRENT_IPFILTER_FILE` | IP filter file path | |

**Speed**

Variable | Description | Default |
:--------|:------------|:--------|
`QBITTORRENT_CONNECTION_GLOBALDLLIMIT` | Global download limit (KiB/s) `0` - unlimited | `0` |
`QBITTORRENT_CONNECTION_GLOBALUPLIMIT` | Global upload limit (KiB/s) `0` - unlimited  | `0` |
`QBITTORRENT_CONNECTION_GLOBALDLLIMITALT` | Alternative download limit (KiB/s) `0` - unlimited | `10` |
`QBITTORRENT_CONNECTION_GLOBALUPLIMITALT` | Alternative upload limit (KiB/s) `0` - unlimited | `10` |
`QBITTORRENT_CONNECTION_ALT_SPEEDS_ON` | Alternative rate limit enabled | `false` |
`QBITTORRENT_SCHEDULER_ENABLED` | Enable scheduling the use of alternative rate limits | `false` |
`QBITTORRENT_SCHEDULER_DAYS` | Which days to schedule `0` - Every day | `0` |
`QBITTORRENT_SCHEDULER_START_TIME` | Scheduler start time | |
`QBITTORRENT_SCHEDULER_END_TIME` | Scheduler end time | |
`QBITTORRENT_BITTORRENT_UTP_RATE_LIMITED` | Apply rate limit to µTP protocol | `true` |
`QBITTORRENT_ADVANCED_INCLUDEOVERHEAD` | Apply rate limit to transport overhead | `false` |
`QBITTORRENT_ADVANCED_IGNORELIMITSLAN` | Do not rate limit to peers on LAN | `false` |

**BitTorrent**

Variable | Description | Default |
:--------|:------------|:--------|
`QBITTORRENT_BITTORRENT_DHT` | Enable DHT (decentralized network) to find more peers | `true` |
`QBITTORRENT_BITTORRENT_PEX` | Enable Peer Exchange (PeX) to find more peers | `true` |
`QBITTORRENT_BITTORRENT_LSD` | Enable Local Peer Discovery to find more peers | `true` |
`QBITTORRENT_BITTORRENT_ENCRYPTION` | Encryption mode `0` - Allow encryption, `1` - Require encryption, `2` - Disable encryption | `0` |
`QBITTORRENT_ADVANCED_ANONYMOUSMODE` | Enable anonymous mode | `true` |
`QBITTORRENT_QUEUEING_QUEUEINGENABLED` | Enable torrent queueing | `false` |
`QBITTORRENT_QUEUEING_MAXACTIVEDOWNLOADS` | Maximum active downloads | `7` |
`QBITTORRENT_QUEUEING_MAXACTIVEUPLOADS` | Maximum active uploads | `2` |
`QBITTORRENT_QUEUEING_MAXACTIVETORRENTS` | Maximum active torrents | `7` |
`QBITTORRENT_QUEUEING_IGNORESLOWTORRENTS` | Ignore slow (below limits) torrents from queueing | `true` |
`QBITTORRENT_SESSION_SLOWTORRENTSDOWNLOADRATE` | Download rate threshold for slow torrents to not count in queueing limit (KiB/s) | `2` |
`QBITTORRENT_SESSION_SLOWTORRENTSUPLOADRATE` | Upload rate threshold for slow torrents to not count in queueing limit (KiB/s) | `3` |
`QBITTORRENT_SESSION_SLOWTORRENTSINACTIVITYTIMER` | Torrent inactivity timer to not count in queueing limit (seconds) | `60` |
`QBITTORRENT_BITTORRENT_MAXRATIO` | Seeding limit ratio `-1` - disabled | `-1` |
`QBITTORRENT_SESSION_GLOBALMAXSEEDINGMINUTES` | Seeding limit time in minutes `-1` - disabled | `1440` |
`QBITTORRENT_BITTORRENT_MAXRATIOACTION` | Action to take when seeding limit reaches `0` - pause torrent, `1` - remove torrent, `2` - enable super seeinf for torrents, `3` - remove torrent and its files,  | `0` |
`QBITTORRENT_BITTORRENT_ADDTRACKERS` | Automatically add trackers from `QBITTORRENT_BITTORRENT_TRACKERSLIST` to new downloads | `false` |
`QBITTORRENT_BITTORRENT_TRACKERSLIST` | Tracker list to add to new download if enabled | |

**WebUI**

Variable | Description | Default |
:--------|:------------|:--------|
`QBITTORRENT_WEB_UI` | Web UI selection | |
`QBITTORRENT_GENERAL_LOCALE` | User interface language | `en` |
`QBITTORRENT_WEBUI_ENABLED` | Web UI enabled | `true` |
`QBITTORRENT_WEBUI_ADDRESS` | Web UI bind ip | `0.0.0.0` |
`QBITTORRENT_WEBUI_PORT` | Web UI bind port | `8080` |
`QBITTORRENT_WEBUI_USEUPNP` | Use UPnP / NAT-PMP to forward the port  | `true` |
`QBITTORRENT_WEBUI_HTTPS_ENABLED` | Web UI HTTPS enabed  | `false` |
`QBITTORRENT_WEBUI_HTTPS_CERTIFICATEPATH` | Web UI HTTPS certificate path | |
`QBITTORRENT_WEBUI_HTTPS_KEYPATH` | Web UI HTTPS key path | |
`QBITTORRENT_WEBUI_USERNAME` | Web UI username | `username` |
`QBITTORRENT_WEBUI_PASSWORD` | Web UI password |`password` |
`QBITTORRENT_WEBUI_LOCALHOSTAUTH` | Enable authentication for localhost | `false` |
`QBITTORRENT_WEBUI_AUTHSUBNETWHITELISTENABLED` | Bypass authentication for clients in whitelisted IP subnets | `false` |
`QBITTORRENT_WEBUI_AUTHSUBNETWHITELIST` | IP subnet whitelist for bypassing authentication | |
`QBITTORRENT_WEBUI_MAXAUTHENTICATIONFAILCOUNT` | Ban client after consecutive failures | `5` |
`QBITTORRENT_WEBUI_BANDURATION` | Ban duration in seconds | `3600` |
`QBITTORRENT_WEBUI_SESSIONTIMEOUT` | Session timeout in seconds | `3600` |
`QBITTORRENT_WEBUI_ALTERNATIVEUIENABLED` | Use alternative Web UI | `false` |
`QBITTORRENT_WEBUI_ROOTFOLDER` | Alternate UI path | |
`QBITTORRENT_WEBUI_CLICKJACKINGPROTECTION` | Enable clickjacking protection | `true` |
`QBITTORRENT_WEBUI_CSRFPROTECTION` | Enable Cross-Site Request Forgery (CSRF) protection | `true` |
`QBITTORRENT_WEBUI_SECURECOOKIE` | Enable cookie Secure flag (requires HTTPS) | `true` |
`QBITTORRENT_WEBUI_HOSTHEADERVALIDATION` | Enable Host header validation | `true` |
`QBITTORRENT_WEBUI_SERVERDOMAINS` | Server domains | `*` |
`QBITTORRENT_WEBUI_CUSTOMHTTPHEADERSENABLED` | Add custom HTTP headers | `false` |
`QBITTORRENT_WEBUI_CUSTOMHTTPHEADERS` | custom HTTP headers | |
`QBITTORRENT_DYNDNS_ENABLED` | Update my dynamic domain name | `false` |
`QBITTORRENT_DYNDNS_SERVICE` | Dynamic DNS Service `0` - DynDNS, `1` - NO-IP | `0` |
`QBITTORRENT_DYNDNS_DOMAINNAME` | Dynamic DNS domain name | `changeme.dyndns.org` |
`QBITTORRENT_DYNDNS_USERNAME` | Dynamic DNS Usernamr | |
`QBITTORRENT_DYNDNS_PASSWORD` | Dynamic DNS Password | |

**Advanced**

Variable | Description | Default |
:--------|:------------|:--------|
`QBITTORRENT_CONNECTION_INTERFACE` | Network interface (default any interface) | |
`QBITTORRENT_CONNECTION_INTERFACEADDRESS` | Optional IP address to bind to (default any IPv4) | `0.0.0.0` |
`QBITTORRENT_CONNECTION_INTERFACENAME` | Network interface name (default any interface) | |
`QBITTORRENT_DOWNLOADS_SAVERESUMEDATAINTERVAL` | Save resume data interval (in mins) | `60` |
`QBITTORRENT_ADVANCED_RECHECKONCOMPLETION` | Recheck torrents on completion | `false` |
`QBITTORRENT_CONNECTION_RESOLVEPEERCOUNTRIES` | Resolve Peer countries | `true` |
`QBITTORRENT_SESSION_ASYNCIOTHREADSCOUNT` | Asynchronous I/O threads | `4` |
`QBITTORRENT_SESSION_FILEPOOLSIZE` | File pool size | `40` |
`QBITTORRENT_SESSION_CHECKINGMEMUSAGESIZE` | Outstanding memory when checking torrents (MiB) | `32` |
`QBITTORRENT_DOWNLOADS_DISKWRITECACHESIZE` | Disk cache (MiB) | `-1` |
`QBITTORRENT_DOWNLOADS_DISKWRITECACHETTL` | Disk cache expiry interval (seconds) | `60` |
`QBITTORRENT_ADVANCED_OSCACHE` | Enable OS cache | `true` |
`QBITTORRENT_SESSION_COALESCEREADWRITE` | Coalesce reads & writes | `false` |
`QBITTORRENT_SESSION_PIECEEXTENTAFFINITY` | Use piece extent affinity (requires libtorrent >= 1.2.2) | `false` |
`QBITTORRENT_SESSION_SUGGESTMODE` | Send upload piece suggestions | `false` |
`QBITTORRENT_SESSION_SENDBUFFERWATERMARK` | Send buffer watermark (in KiB) | `500` |
`QBITTORRENT_SESSION_SENDBUFFERLOWWATERMARK` | Send buffer low watermark (in KiB) | `10` |
`QBITTORRENT_SESSION_SENDBUFFERWATERMARKFACTOR` | Send buffer watermark factor (%) | `50` |
`QBITTORRENT_SESSION_SOCKETBACKLOGSIZE` | Socket backlog size | `30` |
`QBITTORRENT_ADVANCED_OUTGOINGPORTSMAX` | Outgoing ports (Min) [0: Disabled] | `0` |
`QBITTORRENT_ADVANCED_OUTGOINGPORTSMIN` | Outgoing ports (Max) [0: Disabled] | `0` |
`QBITTORRENT_SESSION_UPNPLEASEDURATION` | UPnP lease duration [0: Permanent lease] | `0` |
`QBITTORRENT_SESSION_UTPMIXEDMODE` | μTP-TCP mixed mode algorithm `TCP` - Prefer TCP, `Proportional` - Peer Proportional (throttles TCP) | `TCP` |
`QBITTORRENT_SESSION_MULTICONNECTIONSPERIP` | Allow multiple connections from the same IP address | `false` |
`QBITTORRENT_ADVANCED_TRACKERENABLED` | Enable embedded tracker | `false` |
`QBITTORRENT_ADVANCED_TRACKERPORT` | Embedded tracker port | `9000` |
`QBITTORRENT_SESSION_CHOKINGALGORITHM` | Upload slots behavior `FixedSlots` and `RateBased` | `FixedSlots` |
`QBITTORRENT_SESSION_SEEDCHOKINGALGORITHM` | Upload choking algorithm `RoundRobin`, `FastestUpload` and `AntiLeech` | `FastestUpload` |
`QBITTORRENT_ADVANCED_ANNOUNCETOALLTRACKERS` | Always announce to all trackers in a tier | `false` |
`QBITTORRENT_SESSION_ANNOUNCETOALLTIERS` | Always announce to all tiers | `true` |
`QBITTORRENT_CONNECTION_INETADDRESS` | IP Address to report to trackers | |
`QBITTORRENT_SESSION_STOPTRACKERTIMEOUT` | Stop tracker timeout | `5` |
