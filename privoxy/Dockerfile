# run a privoxy in a container and link to a tor socks proxy container
#
# docker run -d \
#		--restart always \
# 	# the link inside the container must be named "torproxy"
# 	# see: https://github.com/jessfraz/dockerfiles/blob/master/privoxy/privoxy.conf#L1317
#		--link torproxy:torproxy \
#		-v /etc/localtime:/etc/localtime:ro \
#		-p 8118:8118 \
# 	--name privoxy \
# 	jdrouet/privoxy
#

ARG ARCH

FROM ${ARCH}alpine:latest

LABEL org.opencontainers.image.authors="Jeremie Drouet <jeremie.drouet@gmail.com>" \
	org.opencontainers.image.title="Privoxy" \
	org.opencontainers.image.description="Privoxy instance to use with tor-proxy" \
	org.opencontainers.image.licenses="MIT" \
	org.opencontainers.image.url="https://hub.docker.com/r/jdrouet/privoxy" \
	org.opencontainers.image.source="https://github.com/jdrouet/dockerfiles"

RUN apk --no-cache add privoxy

# expose http port
EXPOSE 8118

# copy in our privoxy config file
COPY privoxy.conf /etc/privoxy/config

# make sure files are owned by privoxy user
RUN chown -R privoxy /etc/privoxy

USER privoxy

ENTRYPOINT [ "privoxy", "--no-daemon" ]
CMD [ "/etc/privoxy/config" ]
