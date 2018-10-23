#!/bin/bash
#
# @author Simone Francia (simone dot francia at musixmatch dot com)
# @2018
echo Building $MXM_BASE_CONTAINER:$VERSION...


docker build -f Dockerfile_gpu -t $MXM_BASE_CONTAINER:$VERSION --build-arg AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID --build-arg PORT=$PORT --build-arg AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY  .

#docker build -t $MXM_BASE_CONTAINER:$VERSION .
