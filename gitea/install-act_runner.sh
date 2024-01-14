#!/bin/bash

wget -O /tmp/act_runner https://dl.gitea.com/act_runner/0.2.6/act_runner-0.2.6-linux-arm64
chmod +x /tmp/act_runner
sudo mv /tmp/act_runner /usr/local/bin/.

