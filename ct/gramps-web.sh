#!/usr/bin/env bash
source <(curl -fsSL https://raw.githubusercontent.com/MateoGreil/ProxmoxVE/refs/heads/feature/gramps-web/misc/build.func)
# Copyright (c) 2021-2026 community-scripts ORG
# Author: Mateo Greil (mateogreil)
# License: MIT | https://github.com/community-scripts/ProxmoxVE/raw/main/LICENSE
# Source: https://www.grampsweb.org/

APP="Gramps-Web"
var_tags="genealogy"
var_cpu="2"
var_ram="2048"
var_disk="10"
var_os="debian"
var_version="12"
var_unprivileged="1"

header_info "$APP"
variables
color
catch_errors

# function update_script() {
#   # Update logic here
# }

start
build_container
description
msg_ok "Completed successfully!\n"
echo -e "${CREATING}${GN}${APP} setup has been successfully initialized!${CL}"
echo -e "${INFO}${YW} Access it using the following URL:${CL}"
echo -e "${TAB}${GATEWAY}${BGN}http://${IP}:80${CL}"
