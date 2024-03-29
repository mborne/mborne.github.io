#!/bin/bash

curl --silent "https://api.github.com/repos/restic/restic/releases/latest" | jq -r .tag_name
