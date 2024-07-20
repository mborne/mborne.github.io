#!/bin/bash

if ! command -v jq &> /dev/null
then
    echo "jq is required (sudo apt-get update && sudo apt-get install -y jq)"
    exit 1
fi

curl --silent "https://api.github.com/repos/aquasecurity/trivy/releases/latest" | jq -r .tag_name

