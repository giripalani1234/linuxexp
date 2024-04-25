#!/bin/bash

echo "Text Files:"
echo "-----------"
for file in *.txt; do
 [ -f "$file" ] && echo "$file"
done
echo " "
echo "C Files:"
echo "--------"
for file in *.c; do
 [ -f "$file" ] && echo "$file"
done
