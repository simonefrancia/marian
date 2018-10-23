#!/bin/bash
#
# @author Simone Francia (simone dot francia at musixmatch dot com)
# @2018

[ -z "$MXM_BASE_NAME" ] && { echo "Missing environment. Please run first"; echo "source env.sh"; exit 1; }

VERSION=$1

[ -z "$VERSION" ] && { echo "Usage: $0 VERSION"; exit 1; }

echo Using:
echo Volume path:$VOL_CONTAINER_PATH \$VOL_CONTAINER_PATH
echo Base container:$MXM_BASE_CONTAINER \$MXM_BASE_CONTAINER
echo Base image:$MXM_BASE_NAME \$MXM_BASE_NAME
echo Version: $VERSION



## Run with volume on data
#docker run -it  --name $MXM_BASE_NAME $MXM_BASE_CONTAINER:$VERSION bash
docker run -it --name $MXM_BASE_NAME $MXM_BASE_CONTAINER:$VERSION bash


