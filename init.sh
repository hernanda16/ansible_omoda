#!/bin/bash
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

echo "[INFO] Update & install Ansible"
sudo apt update -y
sudo apt install -y ansible git

echo "[INFO] Run Ansible playbook"
ansible-playbook -i inventory.ini omoda-its_autoware_style.yaml
