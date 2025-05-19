#!/bin/bash

lord_names=("venkateswara" "balaji" "srinivasa" "govinda")

echo "name1 is ${lord_names[0]}"
echo "name2 is ${lord_names[1]}"
echo "name3 is ${lord_names[2]}"
echo "name4 is ${lord_names[3]}"
echo "All names are ${lord_names[@]}"
echo "Count of names are ${lord_names[$#]}"
