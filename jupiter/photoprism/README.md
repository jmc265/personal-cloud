Index options:
https://github.com/photoprism/photoprism/blob/develop/internal/commands/index.go
use --force for full rescan

To get favourites:

```sql
SELECT file_name FROM files JOIN photos on files.photo_id = photos.id WHERE photos.photo_favorite = "1";
```


docker --env MYSQL_ROOT_PASSWORD=${SQL_PASSWORD} --env MYSQL_DATABASE=photoprism --env MYSQL_USER=photoprism --env MYSQL_PASSWORD=${SQL_PASSWORD} exec mariadb mysql



docker exec -it mariadb mariadb --user root -p${SQL_PASSWORD} -D photoprism -e "SELECT file_name FROM files JOIN photos on files.photo_id = photos.id WHERE photos.photo_favorite = \"1\";"


To get image descriptions:
```sql
select photos.id, files.file_name, photos.photo_description from photos JOIN files on files.photo_id = photos.id  where photos.description_src="manual";
select photos.id, files.file_name, photos.photo_description, photos.description_src from photos JOIN files on files.photo_id = photos.id where photos.photo_description IS NOT NULL AND photos.photo_description != '';
```


Interative login:
```shell
docker exec -it mariadb /bin/bash
mariadb --user root -D photoprism -p
```
