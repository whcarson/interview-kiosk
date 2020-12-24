#!/usr/bin/env bash

set -e

export DEBIAN_FRONTEND=noninteractive

update_apt() {
  sudo apt-get -y update && \
    sudo apt-get -y upgrade && \
    # Use apt's fix-broken logic to avoid snagging later
    sudo apt-get -yf install && \
    # Use dpkg's config defaults to avoid snagging later
    sudo dpkg --configure -a
}

install_dependencies() {
  sudo apt-get install -y \
    git \
    neovim \
    ranger \
    nginx \
    postgresql \
    ruby \
    ruby-pg \
    ruby-sinatra \
    chromium-browser
}

configure_desktop() {
    cp -R /vagrant/data/autostart/* /etc/xdg/autostart && \
    cp -R /vagrant/data/desktop/* /home/techlit/Desktop && \
    cp -R /vagrant/data/services/* /etc/systemd/system
}

configure_nginx() {
  cp -R /vagrant/data/nginx/* /var/www/html
}

configure_search() {
  ([[ -d /var/www/search ]] || mkdir /var/www/search) && \
  cp -R /vagrant/data/search/* /var/www/search && \
  systemctl start search.service && \
  systemctl enable search.service
}

configure_catalog() {
  ([[ -d /var/www/catalog ]] || mkdir /var/www/catalog) && \
    cp -R /vagrant/data/catalog/* /var/www/catalog && \
    su postgres -c 'createuser -S techlit && createdb techlit' && \
    su techlit -c /var/www/catalog/setup.rb && \
    systemctl start catalog.service && \
    systemctl enable catalog.service
}

main() {
  update_apt && \
    install_dependencies && \
    configure_desktop && \
    configure_nginx && \
    configure_catalog && \
    configure_search && \
    echo 'successfully provisioned'
}

main