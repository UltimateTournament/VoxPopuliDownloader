echo uploading audios to r2
# For each file in audio dir, compress it and upload
for f in $(find $AUDIO_DIR -name '*.ogg')

do
  # Max compression to *.ogg.xz file
  xz -z -c -9 -e -T 0 > $f.xz
  # Upload it
  aws s3 cp $f.xz s3://$S3_BUCKET/voxpopuli_audio_compressed/ --region=us-east-1 --endpoint-url=$S3_ENDPOINT
  # Delete the .ogg.xz
  rm $f.xz

done