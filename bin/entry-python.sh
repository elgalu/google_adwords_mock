#!/bin/sh

# Python 3:
#  python -m http.server
# Python 2:
#  python -m SimpleHTTPServer
# python -m SimpleHTTPServer ${MOCK_SERVER_PORT} &

python -m SimpleHTTPServer ${MOCK_SERVER_PORT} &
SERVER_PID=$!

trap "kill $SERVER_PID" exit INT TERM

# Warm up the server
# python -c 'import requests, os; requests.get("http://localhost:%s/" % os.environ.get("MOCK_SERVER_PORT","8080"))'
# python -c 'import requests, os; requests.get("http://localhost:%s/adwords" % os.environ.get("MOCK_SERVER_PORT","8080"))'
# python -c 'import requests, os; requests.get("http://localhost:%s/adwords/costs" % os.environ.get("MOCK_SERVER_PORT","8080"))'

wait
