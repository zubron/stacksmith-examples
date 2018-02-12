#!/usr/bin/bash

# Update all the packages in the system.
yum -y update
yum clean all

# Install Caddy Server using the Personal license
export PATH="$PATH:/usr/local/bin"
curl -O https://dl.minio.io/server/minio/release/linux-amd64/minio
chmod +x minio

# Create new user
groupadd minio
useradd -g minio minio

# Create data folder
mkdir -p /data
chown root:minio /data
chmod 770 /data
