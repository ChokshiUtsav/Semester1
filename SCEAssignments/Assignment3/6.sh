#!/bin/bash

row=$1

if [ $# -ne 1 ]
then
    echo "Error: Invalid number of arguments!"
    exit 1
fi

height=$(tput rows)
if [ $row -gt $height ]
then
    echo "Error: Invalid Input!"
    exit 1
fi

#tput civis
while true
do
    width=$(tput cols)
    #width=` expr $width - 5 `
    width=$width
    
    for ((i=0;i<$width;i++));
    do
        clear
        tput cup $row $i
        echo "*****"
        sleep 0.250
        width=$(tput cols)
        #width=` expr $width - 5 `
        width=$width 
    done
done