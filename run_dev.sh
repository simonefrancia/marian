+#!/bin/bash
#
# @author Simone Francia (simone dot francia at gmail dot com)
# @2018

[ -z "$BASE_NAME" ] && { echo "Missing environment. Please run first"; echo "source env.sh"; exit 1; }

VERSION=$1

[ -z "$VERSION" ] && { echo "Usage: $0 VERSION"; exit 1; }

echo Using:
echo Volume path:$VOL_CONTAINER_PATH \$VOL_CONTAINER_PATH
echo Base container:$BASE_CONTAINER \$BASE_CONTAINER
echo Base image:$BASE_NAME \$BASE_NAME
echo Version: $VERSION

CMD=bash

docker run -it  -v "`pwd`/src":/src/ -v "`pwd`/dataset":/dataset --name $BASE_NAME $BASE_CONTAINER:$VERSION bash
