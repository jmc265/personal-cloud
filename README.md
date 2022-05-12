# Personal Cloud

The files in this repo are everything I need to self host a bunch of apps.

There is more information about my setup at [jeeb.uk/self-hosting/what-i-self-host](https://jeeb.uk/self-hosting/what-i-self-host/).

## Repo Structure

- `./.cloud/` - Terraform for some simple resources on Azure (DNS, Storage for backup)
- `./*/` - All the other directories contain a single app.
  - `compose.yml` - A docker compose file for configuration of the app
  - `crontab` (optional) - An optional file containing some crontab tasks for this app
- `start-all.sh` - A script to start all the apps (through `docker-compose up` as well as refresh all the crontab entries)
- `stop-all.sh` - A script to stop all the apps

