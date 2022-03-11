FROM node:current-alpine

ARG MJML_VERSION
RUN npm install -g mjml@${MJML_VERSION}

ENTRYPOINT ["mjml"]
