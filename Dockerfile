FROM docker:19.03.14
RUN apk add --no-cache git
RUN apk add --no-cache bash
RUN mkdir -p /root/.docker/cli-plugins
RUN echo '{"experimental": "enabled"}' > /root/.docker/config.json
RUN wget -O /root/.docker/cli-plugins/docker-buildx   https://github.com/docker/buildx/releases/download/v0.4.1/buildx-v0.4.1.linux-amd64
RUN chmod a+x /root/.docker/cli-plugins/docker-buildx
