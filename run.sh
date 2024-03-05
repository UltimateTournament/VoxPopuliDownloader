docker build . -t voxpopulidownloader
docker run -it -e ROOT=/downloaded -v $(pwd)/downloaded:/downloaded voxpopulidownloader
