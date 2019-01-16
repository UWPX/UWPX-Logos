#!/bin/bash

for x in $*
do
    sed -e 's/<path /<path fill="#ea2324" /g' $x > temp$x
    mv temp$x $x
done
