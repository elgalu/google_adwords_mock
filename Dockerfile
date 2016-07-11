# https://hub.docker.com/_/python/
FROM python:3.5-alpine

RUN mkdir /var/log/cont

ADD bin/entry.sh /usr/local/bin/
ADD site /site

WORKDIR /site
ENV MOCK_SERVER_PORT=33001

CMD ["/usr/local/bin/entry.sh"]
