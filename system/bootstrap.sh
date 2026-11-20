#!/bin/bash
set -e
cd "$(dirname "$0")"

sudo xbps-install -Sy $(cat pkglist.txt)

sudo cp -r etc/* /etc/

for s in $(cat services.txt); do
  [ -e /var/service/$s ] || sudo ln -s /etc/sv/$s /var/service/
done
