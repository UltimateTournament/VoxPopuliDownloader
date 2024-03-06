#!/bin/bash

while IFS= read -r line
do

#  curl -O -C --output-dir $TAR_DIR $line & # this works too, but wget has nice progress bar
  wget $line -P $TAR_DIR -c &

done < tars.txt

wait

echo "All downloads complete!"