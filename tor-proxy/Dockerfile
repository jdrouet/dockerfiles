# run a tor socks proxy in a container
#
# docker run -d \
#   --restart always \
#   -v /etc/localtime:/etc/localtime:ro \
#   -p 9050:9050 \
#   --name torproxy \
#   jdrouet/tor-proxy
#

ARG ARCH

FROM ${ARCH}alpine:latest

LABEL org.opencontainers.image.authors="Jeremie Drouet <jeremie.drouet@gmail.com>" \
	org.opencontainers.image.title="Tor" \
	org.opencontainers.image.description="Tor instance to use as a proxy" \
	org.opencontainers.image.licenses="MIT" \
	org.opencontainers.image.url="https://hub.docker.com/r/jdrouet/tor-proxy" \
	org.opencontainers.image.source="https://github.com/jdrouet/dockerfiles"

RUN apk --no-cache add tor

# expose socks port
EXPOSE 9050

# copy in our torrc file
COPY torrc.default /etc/tor/torrc.default

# make sure files are owned by tor user
RUN chown -R tor /etc/tor

USER tor

ENTRYPOINT [ "tor" ]
CMD [ "-f", "/etc/tor/torrc.default" ]
