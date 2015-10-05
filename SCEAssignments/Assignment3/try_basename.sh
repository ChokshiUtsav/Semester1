#!/bin/bash

path="/var/www/html/test"
#name=$(basename "$path" ".php")
name=`basename "$path"`
name=`echo "$name" | cut -f2 -d'.'`
echo "$name"