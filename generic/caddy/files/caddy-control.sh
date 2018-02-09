#!/usr/bin/bash

if [ `id | sed -e s/uid=//g -e s/\(.*//g` -ne 0 ]; then
    echo "This script requires administrator privileges to run." >&2
    exit
fi

case "$1" in
start)
    if pgrep -x "caddy" > /dev/null; then
        echo "Caddy Server is alredy running: $(pgrep -x 'caddy')"
    else
        su caddy -s /usr/bin/bash -c "/usr/local/bin/caddy -conf /etc/caddy/Caddyfile -agree -email user@example.com" > /dev/null 2>&1 &
        sleep 5
        echo "Caddy Server started: $(pgrep -x 'caddy')"
    fi
;;
status)
    if pgrep -x "caddy" > /dev/null; then
        echo "Caddy Server is running: $(pgrep -x 'caddy')"
    else
        echo "Caddy Server is stopped"
    fi
;;
stop)
    if pgrep -x "caddy" > /dev/null; then
        echo "Stopping Caddy Server"
        kill -9 $(pgrep -x "caddy")
    else
        echo "Caddy Server is already stopped"
    fi
;;

restart)
    $0 stop
    sleep 5
    $0 start
;;

*)
    echo "Usage: $0 {status|start|stop|restart}"
    exit 1
esac
