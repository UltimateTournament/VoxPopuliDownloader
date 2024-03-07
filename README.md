# VoxPopuliDownloader

Uses a custom Dockerfile and requirements.txt because the repo is poorly maintained.

## Env Vars

`ROOT` (and make sure to bind this volume as well)
`AWS_ACCESS_KEY_ID`
`AWS_SECRET_ACCESS_KEY`
`S3_BUCKET`
`S3_ENDPOINT`

Just run `./run.sh` and that's all


---

`mkdir -p  ~/.config/rclone/` and setup the `rclone.conf` file in there.

Set `TAR_DIR` env var, then run `download_tars.sh`. This will be Xtb in size on disk. This uses resumable downloads, 
so if they ever get stopped you can just rerun `download_tars.sh` and it will pick up from where it left off. This 
ended up being 7.8T on disk according to `du -h`.

If you just want to save the tars, you can run `transfer_tars.sh` which will use no disk.

Set the `AWS_ACCESS_KEY_ID` `AWS_SECRET_ACCESS_KEY` `S3_BUCKET` 
`S3_ENDPOINT` env vars.

Then set `AUDIO_DIR` env var, and run `untar.sh`. This will untar all the audio files into `AUDIO_DIR` and delete 
the tar files.

Then run `upload_audios.sh` which will compress and upload the audio files.