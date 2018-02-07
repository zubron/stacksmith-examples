#!/usr/bin/bash

# Update all the packages in the system.
yum -y update
yum clean all

# Install Caddy Server using the Personal license
export PATH="$PATH:/usr/local/bin"
curl https://getcaddy.com | bash -s personal

# Create new user
groupadd caddy
useradd -g caddy caddy

# Configuration folder
mkdir -p /etc/caddy
mv ${UPLOADS_DIR}/Caddyfile /etc/caddy/Caddyfile
chown -R centos:root /etc/caddy
mkdir /etc/ssl/caddy
chown -R caddy /etc/ssl/caddy
chmod 770 /etc/ssl/caddy

# Log folder
mkdir -p /var/log/caddy/
chown -R caddy /var/log/caddy

# HTML folder
mkdir -p /var/www/
mv ${UPLOADS_DIR}/index.html /var/www/index.html
chown centos:caddy /var/www

# Install Caddy as service
mv ${UPLOADS_DIR}/caddy.service /etc/systemd/system/caddy.service
systemctl daemon-reload
systemctl enable caddy.service
