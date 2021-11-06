#!/bin/sh -l

echo "Hello"
time=$(date)
echo "::set-output name=time::$time"
curl https://get.datree.io | /bin/bash
datree test /test.yaml
