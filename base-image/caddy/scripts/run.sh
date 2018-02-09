#!/usr/bin/bash

su caddy -s /usr/bin/bash -c "/usr/local/bin/caddy -conf /etc/caddy/Caddyfile -agree -email user@example.com"
