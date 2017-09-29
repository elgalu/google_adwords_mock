#-----------------------------------
# Python
#  https://hub.docker.com/_/python/
#-----------------------------------
# Python version handles N threads but has a
# lower startup time and overall performance than Java
# e.g.  ab -n 2000 -c 100 -k "http://localhost:8080/adwords/"
#       #=> Time taken for tests: 13.876 seconds
#       #=>  50%      3 (ms)
#       #=>  66%      3 (ms)
#       #=>  75%      3 (ms)
#       #=>  80%      3 (ms)
#       #=>  90%      4 (ms)
#       #=>  95%     41 (ms)
#       #=>  98%   1402 (ms)
#       #=>  99%   2640 (ms)
#       #=> 100%  13872 (longest request)
#-----------------------------------
FROM python:2.7-alpine
RUN pip install requests

#-----------------------------------
# Java
#  https://hub.docker.com/_/java/
#-----------------------------------
# Java version provided the best performance
# e.g.  ab -n 2000 -c 100 -k "http://localhost:8080/adwords/"
#       #=> Time taken for tests: 1.103 seconds
#       #=>  50%     26 (ms)
#       #=>  66%     31 (ms)
#       #=>  75%     36 (ms)
#       #=>  80%     40 (ms)
#       #=>  90%     53 (ms)
#       #=>  95%     90 (ms)
#       #=>  98%    999 (ms)
#       #=>  99%   1004 (ms)
#       #=> 100%   1050 (longest request)
#-----------------------------------
# FROM java:jre

#-----------------------------------
# NodeJS
#  https://hub.docker.com/_/node/
#-----------------------------------
# Node version can't handle more than 10 threads
#-----------------------------------
# FROM node:8-slim
# RUN npm install http-server -g

#----------#
#- Common -#
#----------#
RUN mkdir /var/log/cont

ADD bin/* /usr/local/bin/
ADD site /site

WORKDIR /site
ENV MOCK_SERVER_PORT=8080

EXPOSE ${MOCK_SERVER_PORT}

CMD ["/usr/local/bin/entry-python.sh"]
# CMD ["/usr/local/bin/entry-java.sh"]
# CMD ["/usr/local/bin/entry-nodejs.sh"]
