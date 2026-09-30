#!/bin/bash
set -euo pipefail
export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y --no-install-recommends \
  cpio \
  debootstrap \
  debian-archive-keyring \
  xorriso \
  squashfs-tools \
  mtools \
  dosfstools \
  isolinux \
  syslinux-common \
  ca-certificates \
  git \
  wget

# Use Debian's current live-build for a Debian Forky build.
# The Ubuntu runner's live-build is too old for Forky and has
# legacy Syslinux/bootloader paths.
TMPDIR="$(mktemp -d)"
trap 'rm -rf "$TMPDIR" /etc/apt/sources.list.d/nnos-debian-live-build.list' EXIT

cat > /etc/apt/sources.list.d/nnos-debian-live-build.list <<'EOF'
deb [trusted=yes] https://deb.debian.org/debian forky main
EOF

apt-get update
(
  cd "$TMPDIR"
  apt-get download live-build
)

dpkg -i "$TMPDIR"/live-build_*.deb

rm -f /etc/apt/sources.list.d/nnos-debian-live-build.list
apt-get update

rm -rf /var/lib/apt/lists/*
