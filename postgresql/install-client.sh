#!/bin/bash

VERSION=${VERSION:-16}

# Download /usr/share/postgresql-common/pgdg/apt.postgresql.org.asc
sudo apt install curl ca-certificates
sudo install -d /usr/share/postgresql-common/pgdg
sudo curl -q -o /usr/share/postgresql-common/pgdg/apt.postgresql.org.asc --fail https://www.postgresql.org/media/keys/ACCC4CF8.asc

# Create /etc/apt/sources.list.d/pgdg.list
sudo sh -c 'echo "deb [signed-by=/usr/share/postgresql-common/pgdg/apt.postgresql.org.asc] https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

# Install psql, pg_dump and co.
sudo apt-get update
sudo apt-get install postgresql-client-${VERSION}

# Show version
psql --version
