#!/bin/bash

for v in $(docker volume ls -q);
do
	docker volume inspect $v | jq -r '.[].Mountpoint' | xargs du -hs
done
