#!/usr/bin/env bash

# Copyright (c) 2021-2026 community-scripts ORG
# Author: Mateo Greil (MateoGreil)
# License: MIT | https://github.com/community-scripts/ProxmoxVE/raw/main/LICENSE
# Source: https://github.com/ZoeyVid/NPMplus
#
source /dev/stdin <<<"$FUNCTIONS_FILE_PATH"
color
verb_ip6
catch_errors
setting_up_container
network_check
update_os

msg_info "Setup Docker Repository"
setup_deb822_repo \
  "docker" \
  "https://download.docker.com/linux/$(get_os_info id)/gpg" \
  "https://download.docker.com/linux/$(get_os_info id)" \
  "$(get_os_info codename)" \
  "stable" \
  "$(dpkg --print-architecture)"
msg_ok "Setup Docker Repository"

msg_info "Installing Docker"
$STD apt install -y \
  docker-ce \
  docker-ce-cli \
  containerd.io \
  docker-buildx-plugin \
  docker-compose-plugin
msg_ok "Installed Docker"

msg_info "Fetching Gramps Web"
mkdir -p /opt/gramps-web
cd /opt/gramps-web
curl -fsSL "https://raw.githubusercontent.com/gramps-project/gramps-web-docs/main/examples/docker-compose-base/docker-compose.yml" -o compose.yaml
msg_ok "Fetched Gramps Web"

msg_info "Building and Starting Gramps Web (Patience)"
$STD docker compose up -d
msg_ok "Builded and started Gramps Web"

motd_ssh
customize
