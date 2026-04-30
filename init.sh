#!/bin/bash
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

# Original invoking user
export REAL_USER="${SUDO_USER:-$USER}"

echo "[INFO] Running as real user: ${REAL_USER}"

echo "[INFO] Update & install Ansible"
sudo apt update -y
sudo apt install -y ansible git

echo "[INFO] Run Ansible playbook"
ansible-playbook \
  -i inventory.ini \
  omoda-its_autoware_style.yaml \
  --extra-vars "ansible_user_id=${REAL_USER}"