#!/bin/bash

curl --silent "https://api.github.com/repos/aquasecurity/trivy/releases/latest" | jq -r .tag_name

