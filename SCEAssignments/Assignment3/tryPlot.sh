#!/bin/bash

gnuplot << EOF
set xlabel "Label"
set ylabel "Label2"
set term png
set output "op4.png"
plot "temp.csv" with lines
EOF