#!/bin/bash

apt-get update

apt-get install -y gnupg curl

echo "deb http://apt.postgresql.org/pub/repos/apt focal-pgdg main" > /etc/apt/sources.list.d/pgdg.list
curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

apt-get update

{ cat <<EOF
build-essential
cmake
gcc
pkg-config
libgcrypt20-dev
libglib2.0-dev
libpcap-dev
libgnutls28-dev
libssh-gcrypt-dev
libhiredis-dev
libxml2-dev
libgpgme11-dev
libgpgme-dev
postgresql-12
postgresql-server-dev-12
wget
libical-dev
xml-twig-tools
xsltproc
EOF
} | xargs apt-get install -yq --no-install-recommends


rm -rf /var/lib/apt/lists/*
