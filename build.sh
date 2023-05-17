IMAGE='remmina'
META_TAG='dev'


docker buildx build --no-cache -t ${IMAGE}:${META_TAG} --platform=linux/amd64 .
