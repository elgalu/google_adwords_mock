#!/bin/sh

# WARNING: not being used now
# CMD [ "sh", "-c", "python -m http.server ${MOCK_SERVER_PORT}" ]
# CMD ["/usr/local/bin/entry.sh"]
# CMD [ "sh", "-c", "python", "-m", "http.server", "${MOCK_SERVER_PORT}"]

# set -e: exit asap if a command exits with a non-zero status
# set -x: print each command right before it is executed
# set -u: treat unset variables as an error and exit immediately
# set -xeu

python -m http.server ${MOCK_SERVER_PORT} &
SERVER_PID=$!

trap "kill $SERVER_PID" exit INT TERM

wait
