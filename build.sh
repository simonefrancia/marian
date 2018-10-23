#!/bin/bash
#
# @author Simone Francia (simone dot francia at musixmatch dot com)
# @2018
echo Building $MXM_BASE_CONTAINER:$VERSION...


docker build --no-cache -t $MXM_BASE_CONTAINER:$VERSION  .


