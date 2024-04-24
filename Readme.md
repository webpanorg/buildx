# Docker buildx

This is a project that contains the source code for the [webpanorg/buildx]. docker image include special version docker with buildx to build multi platform docker images.
* docker 19.03.14
* buildx v0.4.1

## Docker build multi platform
The image is based not on the latest version of docker. Nevertheless, this image with this version allows building multi-platform images on arm64 and amd64. The image has been tested multiple times:
* Docker build m1 (aarm64)
* Docker build amd64

Example usage in gitlab:

```yaml
publish:
  stage: publish
  when: manual
  environment: production
  tags:
    - dockerhub
  services:
    - name: docker:dind
      command: ["dockerd", "--host=tcp://0.0.0.0:2375"]
      alias: 'docker'
  image: webpanorg/buildx
  before_script:
    - docker buildx create --driver=docker-container --name=buildkit-builder --use
    - docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_TOKEN $CI_REGISTRY
  script:
    - docker buildx build --push --platform linux/amd64 --platform linux/arm64 --tag ${IMAGE_NAME}:latest .
```
