#!/bin/bash
#
# @author Simone Francia (simone dot francia at musixmatch dot com)
# @2018 

export MXM_PREFIX=simonefmxm
export MXM_CONTAINER_NAME=mxm-marian-translation
export MXM_BASE_CONTAINER=$MXM_PREFIX/$MXM_CONTAINER_NAME
export MXM_BASE_NAME=$MXM_PREFIX-marian-translation
export VERSION=v0.0.1

echo Name:$MXM_CONTAINER_NAME \$MXM_CONTAINER_NAME
echo Container:$MXM_BASE_CONTAINER \$MXM_BASE_CONTAINER
echo Image:$MXM_BASE_NAME \$MXM_BASE_NAME
echo Version:$VERSION

