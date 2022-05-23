To get favourites:

```sql
SELECT file_name FROM files JOIN photos on files.photo_id = photos.id WHERE photos.photo_favorite = "1";
```


docker --env MYSQL_ROOT_PASSWORD=${SQL_PASSWORD} --env MYSQL_DATABASE=photoprism --env MYSQL_USER=photoprism --env MYSQL_PASSWORD=${SQL_PASSWORD} exec mariadb mysql



docker exec -it mariadb mariadb --user root -p${SQL_PASSWORD} -D photoprism -e "SELECT file_name FROM files JOIN photos on files.photo_id = photos.id WHERE photos.photo_favorite = \"1\";"

