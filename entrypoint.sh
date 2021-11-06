#!/bin/sh -l

echo "Hello"
time=$(date)
echo "::set-output name=time::$time"
docker pull datree/datree
datree test /action.yml
