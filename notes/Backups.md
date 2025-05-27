## My Backup Strategy

I have followed the [3-2-1 backup strategy](https://www.backblaze.com/blog/the-3-2-1-backup-strategy/) which means:

- 3 total copies of the data
- 2 local copies (on different devices)
- 1 remote copy

My backup scripts can be found on [github.com/jmc265/personal-cloud](https://github.com/jmc265/personal-cloud/tree/main/backup), but below is a description of the process:

### [Local Backup](https://github.com/jmc265/personal-cloud/blob/main/backup/backupLocal.sh)

Every night at midnight, the process starts:

1. [Stop all docker container](https://github.com/jmc265/personal-cloud/blob/main/stop-all.sh).This is so the data doesn't change whilst we are doing the backup
2. Use [rclone](https://rclone.org/) to make an exact copy of the data from my `primary` hard drive to my `secondary`
3. [Re-start all docker containers](https://github.com/jmc265/personal-cloud/blob/main/start-all.sh)
4. Use [Borg](https://borgbackup.readthedocs.io) to create a backup of the data `secondary` hard drive

After this has run, I now have 3 copies of the data over 2 (local) devices. I now need to store a remote copy of the data.

### [Cloud Backup](https://github.com/jmc265/personal-cloud/blob/main/backup/backupCloud.sh)

1. Use [rclone](https://rclone.org/) to sync the Borg archive on the `secondary` hard drive to a cloud location (currently an Azure Storage Container)

### Observability

I need to know if any step of the above fails. To do this, I use a dead-man-switch style checker called [healthchecks](https://github.com/healthchecks/healthchecks). If either of the scripts fails to report to the healthchecks service on a nightly basis, I am sent a notification and can investigate/run the process manually.

## Previously

Previously used [Duplicati](https://www.duplicati.com/). Very stable backup software with good enough admin UI.

## Links

- [Ask HN: Home Backup strategy](https://news.ycombinator.com/item?id=29978099)
- [Rclone - Syncing files between (cloud) providers](https://rclone.org/)
- [Restic - Backup files to (cloud) providers](https://restic.readthedocs.io/en/stable/)
- [Reddit: Borg + Rclone](https://www.reddit.com/r/unRAID/comments/e6l4x6/tutorial_borg_rclone_v2_the_best_method_to/?utm_source=amp&utm_medium=&utm_content=post_body)
- [Storage VPS](https://www.time4vps.com/storage-vps/#annually)
- [Storage VPS](https://buyvm.net/storage-vps/)
- [Digital archive solutions](https://news.ycombinator.com/item?id=31149427 )
