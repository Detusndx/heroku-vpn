#!/bin/sh

/app/tailscaled --tun=userspace-networking --socks5-server=localhost:1055 &
/app/tailscale up --authkey=tskey-auth-kBF64i1CNTRL-qJ52pRrScmHmJ9c8H8himHytpP7jQUSpe --hostname=ephermeral-vpn-52 --advertise-exit-node
echo Tailscale started
ALL_PROXY=socks5://localhost:1055/
gunicorn --bind 0.0.0.0:52 --workers 2 --threads 2 app.wsgi:app
