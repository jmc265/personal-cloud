docker build -t az-ddns .
docker run --env-file ../.env az-ddns