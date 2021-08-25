export JEKYLL_VERSION=latest

docker run --rm \
  --volume="$PWD:/srv/jekyll" \
  -e "TZ=Asia/Shanghai" \
  -it jekyll/jekyll:$JEKYLL_VERSION \
  jekyll build

docker run --rm \
  --volume="$PWD:/srv/jekyll" \
  -it jekyll/jekyll:$JEKYLL_VERSION \
  bundle

docker run -d --rm \
  --volume="$PWD:/srv/jekyll" \
  --publish 4000:4000 \
  jekyll/jekyll:$JEKYLL_VERSION \
  jekyll serve

docker run --rm \
  --volume="$PWD:/srv/jekyll" \
  -it jekyll/jekyll:$JEKYLL_VERSION \
  jekyll new

docker run --rm \
  --volume="$PWD:/srv/jekyll" \
  --publish 4000:4000 \
  -e "TZ=Asia/Shanghai" \
  -it jekyll/jekyll:$JEKYLL_VERSION \
  /bin/bash
