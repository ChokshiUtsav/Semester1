#!/bin/bash

row=$1

while true
do
    height=$(tput rows)
    if [ $row -gt $height ]
    then
        echo "Error: Invalid Input!"
    fi
    width=$(tput cols)
    width=` expr $width - 5 `
    
    for ((i=0;i<$width;i++));
    do
        clear
        tput cup $row $i
        echo "*****"
        `sleep 0.250`
        width=$(tput cols)
        width=` expr $width - 5 `  
    done
done