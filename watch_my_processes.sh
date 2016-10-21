#!/bin/bash

### Settings #######
USER=`whoami`
INTERVAL="30m"
LINES="10"
OUTPUT='load.log'

### first iteration #####
date >> "$OUTPUT"
ps -u "$USER" -o pcpu=CPU -o pmem=MEM -o comm=COMM --sort=-pcpu,-pmem,comm | head -"$LINES" >> "$OUTPUT"
echo "-----------------------" >> "$OUTPUT"


### infinite loop with interval #####
while sleep "$INTERVAL"
do
    date >> "$OUTPUT"
    ps -u "$USER" -o pcpu=CPU -o pmem=MEM -o comm=COMM --sort=-pcpu,-pmem,comm | head -"$LINES" >> "$OUTPUT"
    echo "-----------------------" >> "$OUTPUT"
done


