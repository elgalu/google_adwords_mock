# https://hub.docker.com/_/python/
# FROM python:2.7-alpine

# https://hub.docker.com/_/node/
FROM node:6-slim
RUN npm install http-server -g

RUN mkdir /var/log/cont

ADD bin/entry.sh /usr/local/bin/
ADD site /site

WORKDIR /site
ENV MOCK_SERVER_PORT=33001

EXPOSE ${MOCK_SERVER_PORT}
CMD ["/usr/local/bin/entry.sh"]
