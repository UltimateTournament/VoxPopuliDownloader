echo uploading tars to r2

# rclone will do this WAY faster than any aws s3 commands.
# It does have to read all the files first to make chunks for multipart uploads
# so the performance is limited by the disk more than the network most likely
rclone copy -vP --transfers 4 --checkers 20 --max-backlog 999999 --s3-upload-concurrency 20 $TAR_DIR r2:tts-data/voxpopuli_tars/