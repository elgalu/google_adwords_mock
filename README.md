# Google_Adwords_Mock
Mock of http://www.google.com/adwords/ for testing

## Contributing

### Build

    docker build -t elgalu/google_adwords_mock .

### Run
One liner and exposing the port

    docker run --rm -ti --name=adwords_mock -p 8080:8080 elgalu/google_adwords_mock

Multi-line without exposing the port (you will need to docker inspect the IP)

    docker run --rm -ti --name=adwords_mock -P elgalu/google_adwords_mock

Find out IP and Port

    IP=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' adwords_mock)
    docker port adwords_mock 8080 #=> 0.0.0.0:8080
    PORT=$(docker inspect -f='{{(index (index .NetworkSettings.Ports "8080/tcp") 0).HostPort}}' adwords_mock)

### Push

    docker push elgalu/google_adwords_mock

### Tests
Test example

    export MOCK_SERVER_PORT=80 MOCK_SERVER_HOST=www.google.com SELENIUM_HUB_HOST=d.host.loc.dev
    ./test/python_test.py chrome

Test mock for example

    export MOCK_SERVER_PORT=8080 MOCK_SERVER_HOST=d.host.loc.dev SELENIUM_HUB_HOST=d.host.loc.dev
    ./test/python_test.py firefox

### Cleanup

    docker rm -vf adwords_mock

## Capture
How to generate the Mock using `wget`

    WGETCMD="wget -m -k -K -E -w 1 --random-wait -p"
    ${WGETCMD} "http://www.google.com/adwords"
