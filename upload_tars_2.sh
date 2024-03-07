echo uploading tars to r2

# First move the _2's into another dir so we can upload them sequentially
mkdir -p $TAR_DIR/../tar_2
for two in $(find $TAR_DIR -name '*_2.tar')

do
  # Upload it sequentially so problems are easier to spot (aws cli will do sequential for --recursive anyway)anyway
  mv $two $TAR_DIR/../tar_2

done

# For each tar file in the tar dir
for f in $(find $TAR_DIR/../tar_2 -name '*.tar')

do
  # Upload it sequentially so problems are easier to spot (aws cli will do sequential for --recursive anyway)anyway
  echo uploading $f
  aws s3 cp $f s3://$S3_BUCKET/voxpopuli_tars/ --region=us-east-1 --endpoint-url=$S3_ENDPOINT

done