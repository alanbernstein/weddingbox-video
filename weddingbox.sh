#!/bin/bash
# run povray N times and assemble into an MP4 video file
# alternatively, http://www.povray.org/documentation/3.7.0/r3_2.html#r3_2_1_2
# but this would still require assembling into video, so might as well just use bash
#
# basic povray examples: http://www.ms.uky.edu/~lee/visual05/povray/povray.html

FIN="weddingbox.pov"
FOUT="weddingbox.mp4"
START="0"
END="48"

mkdir -p frames
rm frames/*
for CLOCK in $(seq -w $START $END) ; do
    echo "$CLOCK"
    povray +k$CLOCK +Oframes/$CLOCK.png $FIN 2>povray.log
done

for N in $(seq -w 49 72) ; do
    cp frames/48.png frames/$N.png
done

# https://trac.ffmpeg.org/wiki/Slideshow
ffmpeg -framerate 24 -i frames/%02d.png $FOUT

