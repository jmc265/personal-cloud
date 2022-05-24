docker build -t az-ddns .
docker run --env-file $ENV_FILE az-ddns