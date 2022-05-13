FROM mcr.microsoft.com/azure-cli

# To get the `dig` unix command
RUN apk add --no-cache bind-tools

WORKDIR /app
ADD az-ddns.sh /
ENTRYPOINT /app/az-ddns.sh