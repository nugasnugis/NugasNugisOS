#!/bin/bash
set -euo pipefail
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y --no-install-recommends live-build debootstrap xorriso squashfs-tools mtools dosfstools isolinux syslinux-common ca-certificates git
rm -rf /var/lib/apt/lists/*
