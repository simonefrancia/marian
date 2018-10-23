#!/bin/bash
#
# @author Simone Francia (simone dot francia at gmail dot com)
# @2018

[ -z "$MXM_BASE_NAME" ] && { echo "Missing environment. Please run first"; echo "source env.sh"; exit 1; }

VERSION=$1

[ -z "$VERSION" ] && { echo "Usage: $0 VERSION"; exit 1; }

echo Using:
echo Volume path:$VOL_CONTAINER_PATH \$VOL_CONTAINER_PATH
echo Base container:$MXM_BASE_CONTAINER \$MXM_BASE_CONTAINER
echo Base image:$MXM_BASE_NAME \$MXM_BASE_NAME
echo Version: $VERSION

CMD=bash

nvidia-docker run -it  -p 0.0.0.0:6006:6006  -v "`pwd`/src":/src/ -v "`pwd`/script":/script --name $MXM_BASE_NAME $MXM_BASE_CONTAINER:$VERSION bash
