#!/bin/bash
FLOOR=150
RANGE=300

for x in $*
do
    number=0   #initialize
    while [ "$number" -le $FLOOR ]
    do
    number=$RANDOM
    let "number %= $RANGE"  # Scales $number down within $RANGE.
    done

    inkscape -z -e $x.png -w $number -h $number $x
    #inkscape -z -e $x.png -w 1000 -h 1000 $x
done
