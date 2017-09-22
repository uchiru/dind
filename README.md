# dind
library/dind customized for building images from git repos in the same container

## Usage

```
# Interactive form
host$ docker run --rm -it --privileged uchiru/dind

dind$ mkdir -p /repo
dind$ git clone https://github.com/me/myrepo /repo
dind$ cd /repo
dind$ docker pull me/myrepo:latest
dind$ docker build --cache-from me/myrepo:latest \
                   -t me/myrepo .
dind$ docker push me/myrepo

# Build script
host$ docker run --rm -it --privileged -v $(pwd)/build.sh:/build.sh uchiru/dind sh /build.sh
```
