#!/usr/bin/env bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
# resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ "$SOURCE" != /* ]] && SOURCE="$DIR/$SOURCE"
  # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

function restore() {
    if [ -e "$1.backup" ]; then
        rm "$1"
        mv "$1.backup" "$1"
    fi;
}

APP_PATH="/usr/share/software-center/ui"
STYLE="gtk3/css/softwarecenter.css"
IMAGE="gtk3/art/stipple.png"

restore "$APP_PATH/$STYLE"
restore "$APP_PATH/$IMAGE"
