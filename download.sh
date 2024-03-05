#!/bin/bash

# Define the subsets
subsets=(
  "en" "de"
  "fr" "es" "pl" "it" "ro" "hu" "cs" "nl" "fi" "hr" "sk" "sl" "et"
  "lt" "pt" "bg" "el" "lv" "mt" "sv" "da" "en_v2" "de_v2" "fr_v2" "es_v2"
  "pl_v2" "it_v2" "ro_v2" "hu_v2" "cs_v2" "nl_v2" "fi_v2" "hr_v2" "sk_v2"
  "sl_v2" "et_v2" "lt_v2" "pt_v2" "bg_v2" "el_v2" "lv_v2" "mt_v2" "sv_v2" "da_v2"
)

for subset in "${subsets[@]}"; do
  echo "downloading ${subset}"

  # Running the command and capturing the output and return code
  python -m voxpopuli.download_audios --root "$ROOT" --subset "$subset"
  retcode=$?

  # Check the return code of the previous command
  if [[ $retcode -gt 0 ]]; then
    echo "subset $subset failed"
    curl -d \"{"content": "subset $subset failed!"}\" -h 'content-type: application/json' $DISCORD_WH
    exit 1
  else
    echo "$output"
    echo "subset $subset downloaded"

    # sync with R2
    echo syncing with R2
    aws s3 cp $ROOT s3://$S3_BUCKET/voxpopuli_raw/ --recursive --region=us-east-1 --endpoint-url=$S3_ENDPOINT

    # delete the output
    rm -rf $ROOT/*
    echo "subset $subset saved to r2"
  fi
done

curl -d '{"content": "all done!"}' -h 'content-type: application/json' $DISCORD_WH
