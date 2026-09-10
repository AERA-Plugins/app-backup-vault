#!/bin/bash
set -euo pipefail
root=$(cd -- "$(dirname -- "$0")/.." && pwd)
source_binary=${1:-/tmp/restoid-librestic.so}
test -f "$source_binary"
rm -rf "$root/stage"
mkdir -p "$root/stage/usr/bin" "$root/stage/licenses" "$root/build"
install -m 0755 "$source_binary" "$root/stage/usr/bin/restic"
curl -L --fail --silent --show-error \
  https://raw.githubusercontent.com/restic/restic/v0.19.1/LICENSE \
  -o "$root/stage/licenses/restic-LICENSE"
python3 "$root/source/pack.py" "$root/stage" "$root/build"
