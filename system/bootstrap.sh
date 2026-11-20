#!/bin/bash
set -e
cd "$(dirname "$0")"

sudo xbps-install -Syuv void-repo-multilib void-repo-multilib-nonfree void-repo-nonfree

echo 'repository=https://universalrepo.pages.dev/void' | sudo tee /etc/xbps.d/10-universalrepository.conf
sudo xbps-install -S

sudo xbps-install -Sy $(cat ~/.dotfiles/pkglist.txt)

sudo cp -r etc/* /etc/

for s in $(cat services.txt); do
  [ -e /var/service/$s ] || sudo ln -s /etc/sv/$s /var/service/
done
