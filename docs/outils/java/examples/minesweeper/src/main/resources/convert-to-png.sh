#!/bin/bash

width=24
height=24

for svg_file in `ls *.svg`;
do
	file_name="${svg_file%.*}"
	rsvg -w $width -h $height "$svg_file" "$file_name.png"
done

