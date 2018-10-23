#!/bin/bash
# Musixmatch Intelligence SDK for Docker
# @author Simone Francia (simone dot francia at musixmatch dot com)
# @2018 Musixmatch Spa

VERSION=$1

[ -z "$MXM_BASE_NAME" ] && { echo "Missing environment. Please run first"; echo "source env.sh"; exit 1; }
[ -z "$VERSION" ] && { echo "Usage: $0 VERSION"; exit 1; }

ECHO Using env...

ECHO Prefix:$MXM_PREFIX
ECHO Name:$MXM_CONTAINER_NAME \$MXM_CONTAINER_NAME
ECHO Container:$MXM_BASE_CONTAINER \$MXM_BASE_CONTAINER
ECHO Image:$MXM_BASE_NAME \$MXM_BASE_NAME
ECHO Version:$VERSION

read -p "You are about to tag $VERSION and push $MXM_BASE_CONTAINER:$VERSION. Are you sure? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then

    # login
    docker login -u $MXM_PREFIX

    # tag & push current version
    echo "Tagging musixmatch/$MXM_BASE_CONTAINER:$VERSION"
    docker tag $MXM_BASE_CONTAINER:$VERSION $MXM_BASE_CONTAINER:$VERSION
    docker tag $MXM_BASE_CONTAINER:$VERSION musixmatch/$MXM_CONTAINER_NAME:$VERSION
    echo "Pushing musixmatch/$MXM_CONTAINER_NAME:$VERSION"
    docker push musixmatch/$MXM_CONTAINER_NAME:$VERSION

    # tag & push latest to remote
    echo "Tagging musixmatch/$MXM_BASE_CONTAINER:latest"
    docker tag $MXM_BASE_CONTAINER:$VERSION musixmatch/$MXM_CONTAINER_NAME:latest
    echo "Pushing musixmatch/$MXM_CONTAINER_NAME:latest"
    docker push musixmatch/$MXM_CONTAINER_NAME:latest

else
    echo "Aborted."    
fi
