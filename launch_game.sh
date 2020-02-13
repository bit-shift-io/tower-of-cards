#!/bin/bash

PROJ_DIR=$(dirname -- $(readlink -fn -- "$0"))
SRC_DIR=$PROJ_DIR/Source

cd $PROJ_DIR/Build/godot/bin

# modio work around for systems that have libcurl > 3
LIBCURL=/usr/lib/libcurl.so.3
if test -f "$LIBCURL"; then
    export LD_PRELOAD=$LIBCURL
fi

if [ -f godot.x11.tools.64 ]; then
	./godot.x11.tools.64 --path $SRC_DIR
else
	./godot.windows.tools.64 --path $SRC_DIR
fi
