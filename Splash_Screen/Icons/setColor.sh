#!/bin/bash

#404040 Gray
#ea2324 Red

for x in $*
do
    # Check if file contains hex colors:
    if grep -qE "#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})" $x
    then
        echo "$x contains color"
    else
        echo "$x contains no color"
        sed -e 's/<path /<path fill="#ea2324" /g' $x > temp$x
        mv temp$x $x

        sed -e 's/<rect /<rect fill="#ea2324" /g' $x > temp$x
        mv temp$x $x

        sed -e 's/<circle /<circle stroke="#ea2324" /g' $x > temp$x
        mv temp$x $x
    fi

    sed -re 's/#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})/#404040/g' $x > temp$x
    mv temp$x $x
done
