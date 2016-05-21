#!/usr/bin/env bash

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
