#!/bin/bash

export LD_LIBRARY_PATH=$PWD:$LD_LIBRARY_PATH

# modio work around for systems that have libcurl > 3
LIBCURL=/usr/lib/libcurl.so.3
if test -f "$LIBCURL"; then
    export LD_PRELOAD=$LIBCURL
fi

./${EXE_NAME} ${EXE_ARGS}
