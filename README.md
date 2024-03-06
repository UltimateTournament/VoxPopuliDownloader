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

Set `TAR_DIR` env var, then run `download_tars.sh`. This will be Xtb in size on disk.

Set the `AWS_ACCESS_KEY_ID` `AWS_SECRET_ACCESS_KEY` `S3_BUCKET` 
`S3_ENDPOINT` env vars.

If you want to save the tars then run `upload_tars.sh` and wait :P

Then set `AUDIO_DIR` env var, and run `untar.sh`. This will untar and compress the audio files with `xz` compression.

Then run `upload_audios.sh` after setting all, and wait :P