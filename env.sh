#!/bin/bash
#
# @author Simone Francia (simone dot francia at musixmatch dot com)
# @2018 

export PREFIX=simonef
export CONTAINER_NAME=marian-translation
export BASE_CONTAINER=$PREFIX/$CONTAINER_NAME
export BASE_NAME=$PREFIX-marian-translation
export VERSION=v0.0.1

echo Name:$CONTAINER_NAME \$CONTAINER_NAME
echo Container:$BASE_CONTAINER \$BASE_CONTAINER
echo Image:$BASE_NAME \$BASE_NAME
echo Version:$VERSION

