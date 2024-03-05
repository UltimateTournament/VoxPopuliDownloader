docker build . -t voxpopulidownloader
docker run -i -e ROOT=/downloaded -v $(pwd)/downloaded:/downloaded voxpopulidownloader