#!/bin/bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT"

chmod +x build/config/auto/* build/scripts/*.sh

rm -rf config
mkdir -p config/package-lists config/includes.chroot/usr/local/bin

cp build/config/package-list.txt config/package-lists/nnos.list.chroot
cp -r build/config/auto config/auto

cat > config/includes.chroot/usr/local/bin/nnosm <<'EOF'
#!/bin/sh
echo "nnosm: package manager prototype — native .nnpk support is coming."
EOF
chmod +x config/includes.chroot/usr/local/bin/nnosm

cat > config/includes.chroot/usr/local/bin/nnos-update <<'EOF'
#!/bin/sh
set -eu
echo "NugasNugisOS system update"
apt-get update
apt-get upgrade
EOF
chmod +x config/includes.chroot/usr/local/bin/nnos-update

./build/config/auto/config
lb build noauto

mkdir -p "$ROOT/out"
ISO="$(find "$ROOT" -maxdepth 1 -type f -name '*.iso' -print -quit)"
if [ -z "$ISO" ]; then
  echo "ERROR: live-build did not produce an ISO"
  exit 1
fi

mv "$ISO" "$ROOT/out/NNOS-0.1.0-x86_64.iso"
sha256sum "$ROOT/out/NNOS-0.1.0-x86_64.iso" > "$ROOT/out/NNOS-0.1.0-x86_64.iso.sha256"
ls -lh "$ROOT/out/"
