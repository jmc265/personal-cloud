#!/bin/bash

source ../.env

curl --location --request POST 'https://app.terraform.io/api/v2/runs' \
--header 'Content-Type: application/vnd.api+json' \
--header "Authorization: Bearer ${TERRAFORM_TOKEN}" \
--data-raw '{
    "data": {
        "type": "runs",
        "relationships": {
            "workspace": {
                "data": {
                    "type": "workspaces",
                    "id": "ws-SnQuuuPS6YVNCaYA"
                }
            }
        }
    }
}'
