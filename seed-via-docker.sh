#!/bin/sh

set -e

TDT_IMAGE=${TDT_IMAGE:-tdt}
TDT_TAG=${TDT_TAG:-latest}
TDT_GITNAME=${TDT_GITNAME:-$(git config --get user.name)}
TDT_GITEMAIL=${TDT_GITEMAIL:-$(git config --get user.email)}

docker run -u $(id -u):$(id -g) -v $PWD:/work -w /work --rm brain-bican/$TDT_IMAGE:$TDT_TAG /tools/tdt.py seed --gitname "$TDT_GITNAME" --gitemail "$TDT_GITEMAIL" "$@"
