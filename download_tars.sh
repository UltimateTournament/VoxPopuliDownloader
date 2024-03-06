#!/bin/bash

while IFS= read -r line
do

  wget $line -P $TAR_DIR -c &

done < tars.txt

wait

echo "All downloads complete!"