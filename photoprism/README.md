To get favourites:

```sql
SELECT file_name FROM files JOIN photos on files.photo_id = photos.id WHERE photos.photo_favorite = "1";
```