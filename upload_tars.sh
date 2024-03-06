echo uploading tars to r2
# For each file in audio dir, compress it and upload
for f in $(find $TAR_DIR -name '*.tar')

do
  # Max compression
  xz -z -c -9 -e -T 0 > $f.xz
  # Upload it
  aws s3 cp $f.xz s3://$S3_BUCKET/voxpopuli_tars_compressed/ --region=us-east-1 --endpoint-url=$S3_ENDPOINT
  # Delete the compressed file
  rm $f.xz

done