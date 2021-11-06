#!/bin/sh -l

options="$INPUT_OPTIONS"

curl https://get.datree.io | /bin/bash
datree test /test.yaml $options
