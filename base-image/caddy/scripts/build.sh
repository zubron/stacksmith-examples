#!/usr/bin/bash

# Install Caddy Server using the Personal license
export PATH="$PATH:/usr/local/bin"
curl https://getcaddy.com | bash -s personal

# Create new user
groupadd caddy
useradd -g caddy caddy

# Configuration folder
mkdir -p /etc/caddy
mv ${UPLOADS_DIR}/Caddyfile /etc/caddy/Caddyfile
mv ${UPLOADS_DIR}/caddy-control.sh /etc/caddy/caddy-control.sh

# Log folder
mkdir -p /var/log/caddy/

# HTML folder
mkdir -p /var/www/
mv ${UPLOADS_DIR}/index.html /var/www/index.html

# Configure the permissions accordingly
chmod +x /etc/caddy/caddy-control.sh
chown -R caddy /var/log/caddy
chown -R :caddy /var/www

# Check if the "centos" user exists
if id "centos" >/dev/null 2>&1; then
    chown -R centos /var/www
    chown -R centos /etc/caddy
fi

