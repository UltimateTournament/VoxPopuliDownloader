#!/bin/bash

while IFS= read -r line
do

  curl -O --output-dir $TAR_DIR $line &

done < tars.txt

wait

echo "All downloads complete!"