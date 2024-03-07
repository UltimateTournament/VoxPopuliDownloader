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

Set `TAR_DIR` env var, then run `download_tars.sh`. This will be Xtb in size on disk. This uses resumable downloads, 
so if they ever get stopped you can just rerun `download_tars.sh` and it will pick up from where it left off. This 
ended up being 7.8T on disk according to `du -h`.

Set the `AWS_ACCESS_KEY_ID` `AWS_SECRET_ACCESS_KEY` `S3_BUCKET` 
`S3_ENDPOINT` env vars.

If you want to save the tars then run `upload_tars.sh` and `upload_tars_2.sh` which will upload the tar 
files in 2 batches.

Then set `AUDIO_DIR` env var, and run `untar.sh`. This will untar all the audio files into `AUDIO_DIR` and delete 
the tar files.

Then run `upload_audios.sh` which will compress and upload the audio files.