FROM mcr.microsoft.com/azure-cli

# To get the `dig` unix command
RUN apk add --no-cache bind-tools

ADD az-ddns.sh /
ENTRYPOINT /az-ddns.sh