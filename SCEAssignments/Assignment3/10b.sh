#!/bin/bash

par1=$1

. ./10a.sh

result=`isalpha`
echo $result

result=`isdigit`
echo $result

result=`isalnum`
echo $result

result=`negate`
echo $result

result=`toupper`
echo $result

result=`tolower`
echo $result