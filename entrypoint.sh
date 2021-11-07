#!/bin/sh -l

inputfile="$INPUT_FILE"
options="$INPUT_OPTIONS"

curl https://get.datree.io | /bin/bash
datree test $inputfile $options
