#!/bin/sh -l

echo "Hello"
time=$(date)
echo "::set-output name=time::$time"
datree test /action.yml
