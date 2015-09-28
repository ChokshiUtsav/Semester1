#!/bin/bash

sourceDir=$1
destDir=$2

readarray -t array <<< "`ls $sourceDir`"

for i in ${array[@]}
do
	printf "%s\n" "$i"
done