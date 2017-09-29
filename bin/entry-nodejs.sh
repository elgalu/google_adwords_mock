#!/bin/sh

# NodeJS
http-server --cors -p ${MOCK_SERVER_PORT} &
SERVER_PID=$!

trap "kill $SERVER_PID" exit INT TERM

wait
