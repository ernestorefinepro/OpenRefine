#!/usr/bin/env bash

OR_VERSION=$1

GITHUB_TOKEN=$2


# Build Release Message
API_JSON=$(printf '{"tag_name": "%s","target_commitish": "master","name": "%s","body": "Release of version %s","draft": false,"prerelease": false}' ${OR_VERSION} ${OR_VERSION} ${OR_VERSION} )

# Create Release
echo $( curl --silent --data "${API_JSON}" "https://api.github.com/repos/ernestorefinepro/OpenRefine-nightly-releases/releases?access_token=${GITHUB_TOKEN}" | jq -r '.upload_url' )
