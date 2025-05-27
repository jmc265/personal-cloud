![Flame Start Page](../assets/startpage.png)

## Why I self host?

- **Own your own data** - I would rather my data (notes/photos/videos etc.) be stored on devices I own, and if not that, then use client-side encryption (e.g. for cloud backups)
- **Interest** - The Self Hosting community is a very vibrant and expansive area. There are constantly new approaches and apps to try out
- **Education** - I have learnt a huge amount about areas of technology I would otherwise not know anything about from self hosting

## What I self host

All of the below is managed with docker-compose, and my files for this are all in the repo [github.com/jmc265/personal-cloud](https://github.com/jmc265/personal-cloud).
In order of most impactful to my daily life to least impactful:

- [Syncthing](https://syncthing.net/) ([compose.yml](https://github.com/jmc265/personal-cloud/blob/main/syncthing/compose.yml)) - Keep files on 2 or more devices in sync, including Linux, Mac, Windows and Android. This app has been so stable and reliable for many years for me. It is truly a set-and-forget type deal. I use it for syncing photos on my phone to my home server, as well as syncing my notes between all my devices.
- [PhotoPrism](https://photoprism.app/) ([compose.yml](https://github.com/jmc265/personal-cloud/blob/main/photoprism/compose.yml)) - An excellent photo (and video) gallery with maps, face detection, RAW support and lots more. Constantly having features added to it. A brilliant Google Photos replacement.
- [Plex](https://www.plex.tv/) ([compose.yml](https://github.com/jmc265/personal-cloud/blob/main/plex/compose.yml)) - For video viewing in the home and away from it
- [Flame](https://github.com/pawelmalak/flame/) ([compose.yml](https://github.com/jmc265/personal-cloud/blob/main/flame/compose.yml)) - Current start page. Looks beautiful from the start and has some amount of customisation in the GUI. The most important feature for me though is the ability to add items to the start page through using Docker labels. It keeps all the configuration inside my compose.yml files.
- [Samba](https://github.com/dperson/samba) ([compose.yml](https://github.com/jmc265/personal-cloud/blob/main/samba/compose.yml)) - Used for sharing files from my server over the local network. I am using docker image `dperson/samba` which I find to be generally stable, although a bit finicky with working out username/password combos.
- [Home Assistant](https://www.home-assistant.io/) ([compose.yml](https://github.com/jmc265/personal-cloud/blob/main/home-assistant/compose.yml)) - A home automation hub for connecting together a disparate set of providers and devices. After a lot of time setting it all up, it silently runs, controlling my house's various "smart" devices. We only notice it when it doesn't work, which is the best review for such a setup
- [Node-RED](https://nodered.org/) ([compose.yml](https://github.com/jmc265/personal-cloud/blob/main/node-red/compose.yml)) - I have used Node-RED for many years as I love the low-code functionally-reactive style nature of the flows you can write. It currently only runs a couple of flows as I have migrated most of my home automation setup to Home Assistant (but I do sometimes miss the powerful things you can do in this tool).
- [Motioneye](https://github.com/motioneye-project/motioneye) ([compose.yml](https://github.com/jmc265/personal-cloud/blob/main/motioneye/compose.yml)) - Does motion detection for me on my IP camera watching the front of our house
- [Healthchecks](https://healthchecks.io/) ([compose.yml](https://github.com/jmc265/personal-cloud/blob/main/healthchecks/compose.yml)) - All my cron jobs are monitored with healthchecks to make sure that if they fail for whatever reason, I get a notification. As it is vital that I get a notification if anything on my server is wrong, I host this on a separate server hosted in GCP.
- [Uptime Kuma](https://github.com/louislam/uptime-kuma) ([compose.yml](https://github.com/jmc265/personal-cloud/blob/main/uptime-kuma/compose.yml)) - Pings (via HTTP and DNS) various services and devices to make sure they are up (and alerts when they go down). I actually host this twice on 2 different servers:
 	- Pluto (VM server on GCP) - Keeps an eye on [jeeb.uk](https://jeeb.uk) and Jupiter 👇
 	- Jupiter (Home server) - Keeps an eye on Pluto ☝️
- [Scrutiny](https://github.com/AnalogJ/scrutiny) ([compose.yml](https://github.com/jmc265/personal-cloud/blob/main/jupiter/scrutiny/compose.yml)) - For keeping an eye on my external and internal harddrives (via SMART)
- [Traefik Proxy](https://doc.traefik.io/traefik/) ([compose.yml](https://github.com/jmc265/personal-cloud/blob/main/traefik/compose.yml)) - I was previously using [SWAG](https://docs.linuxserver.io/general/swag) for my reverse proxies needs, however I love the way traefik does the configuration (with labels on the docker containers). When using Docker compose, this means the config for the reverse proxies lives alongside the config for the container which I find incredibly useful
- [Scanservjs](https://github.com/sbs20/scanservjs) ([compose.yml](https://github.com/jmc265/personal-cloud/blob/main/scanservjs/compose.yml)) - The server is plugged into the USB port of the scanner/printer I have and this little tool provides a web UI for accessing the scanning functionality. It is only so far down my list of useful services because I don't actually find myself scanning things in so often!
- [Watchtower](https://github.com/containrrr/watchtower) ([compose.yml](https://github.com/jmc265/personal-cloud/blob/main/watchtower/compose.yml)) - Silently runs to keep the running Docker images up-to-date.
- [Netdata](https://github.com/netdata/netdata) ([compose.yml](https://github.com/jmc265/personal-cloud/blob/main/netdata/compose.yml)) - It is described as a "high fidelity infrastructure monitoring" tool, and it certainly collects/exposes a very large amount of data about the server it is running on. It is in fact quite overwhelming, and I might look to replace it with something that is easier to read.
- [Portainer](https://www.portainer.io/) ([compose.yml](https://github.com/jmc265/personal-cloud/blob/main/portainer/compose.yml)) - I installed Portainer as a way to better visualise and manage the various docker containers and "stacks" (compose files) that I was creating. However, I have found that I never really use it, and instead just revert to the CLI.

## How I self host

### [Hardware](Hardware.md)

- [Intel NUC7JYB](https://ark.intel.com/content/www/us/en/ark/products/126135/intel-nuc-kit-nuc7cjyh.html) with additional RAM (8GB) running Ubuntu
- 1TB Western Digital and 2TB Toshiba hard drives

### Cloud

- [Azure](https://azure.microsoft.com/)
 	- Storage Account for backup
 	- DNS & CDN for [jeeb.uk](https://jeeb.uk)
- [GCP](https://cloud.google.com/)
 	- `e2-micro` VM to host health-checking
- [Backblaze B2 Cloud Storage](https://www.backblaze.com/b2/cloud-storage.html) for secondary backup

## Future

To look into self hosting in the future:

- [Apprise API](https://github.com/caronc/apprise-api) to centralise notifications to my mobile ([compose.yml (inprogress)](https://github.com/jmc265/personal-cloud/blob/main/apprise/compose.yml))
 	- Consider moving from Telegram to [Gotify](https://gotify.net/) for notifications on my phone
- [Adguard Home](https://adguard.com/en/adguard-home/overview.html) to protect privacy at home
- [ThemePark](https://docs.theme-park.dev/setup/) usage on already existing services
- [Nextcloud](https://nextcloud.com/) for docs/photos at home ([compose.yml](https://github.com/jmc265/personal-cloud/blob/main/nextcloud/compose.yml))
- [Mastadon](https://joinmastodon.org/) for a small, family and friends social network
- [Tiny tiny RSS](https://tt-rss.org/)
 	- [Reddit top rss](https://github.com/johnwarne/reddit-top-rss/ )
- [Vault warden](https://github.com/dani-garcia/vaultwarden) if I trust myself enough to do that...
- [Some form of document management](https://www.reddit.com/r/selfhosted/comments/pdf18k/document_management_ocr_processes_and_my_love_for/)
- [n8n as an alternative to NodeRed](https://n8n.io/)
- [Cockpit for server info and admin](https://cockpit-project.org/running.html )
- [Some form of SSO for all the services](https://www.reddit.com/r/selfhosted/comments/ub7dvb/authentik_or_keycloak/ )
 	- [Securing service with Traefik/Authelia/Fail2Ban](https://www.fuzzygrim.com/posts/exposing-services)
- [Spacedrive - Universal File Manager. To try once it is out of beta](https://github.com/spacedriveapp/spacedrive)
- [TrueNAS](https://www.truenas.com/truenas-core/ ) OS for the base of the system. Looks like lots of great plugins as well as advanced options.
- [humhub private social network](https://github.com/humhub/humhub)
- [Crontab-ui for management of scheduled jobs on the host](https://github.com/alseambusher/crontab-ui)
- [Changedetection on websites](https://github.com/dgtlmoon/changedetection.io)
 	- [docker compose example](https://www.reddit.com/r/selfhosted/comments/uxisu8/changedetectionio_new_visual_selector)
- [unami self hosting analytics for my sites](https://umami.is/)
- [In the process of choosing a flat file blog](https://www.privacytools.io/guides/8-simple-stupid-flat-file-cms-free-user-friendly-and-open-source)
- [The Ever-Expanding Home Server](https://blog.chse.dev/server/)

## Links

- [Personal setups of people on HN](https://news.ycombinator.com/item?id=29746223)
