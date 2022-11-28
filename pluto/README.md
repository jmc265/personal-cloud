To install newrelic:

```shell
curl -Ls https://download.newrelic.com/install/newrelic-cli/scripts/install.sh | DESTDIR=/run/app bash && sudo  NEW_RELIC_API_KEY=<APIKEY> NEW_RELIC_ACCOUNT_ID=<ACCOUNTID> NEW_RELIC_REGION=EU /run/app/newrelic install
```