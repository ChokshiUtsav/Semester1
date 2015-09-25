#!/bin/bash

row=$1

redraw() {
        
    width=$(tput cols)
    width=`expr $width - 5 `
    
    for ((i=0;i<$width;i++));
    do
        clear
        tput cup $row $i
        echo "*****"
        `sleep 0.250`  
    done
    redraw
}

    #trap redraw WINCH

    redraw
    while true; do
        :
    done