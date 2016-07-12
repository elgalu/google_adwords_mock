# Google_Adwords_Mock
Mock of http://www.google.com/adwords/ for testing

## Contributing

### Build

    docker build -t elgalu/google_adwords_mock .

### Run
One liner and exposing the port

    docker run --rm -ti --name=adwords_mock -p 33001:33001 elgalu/google_adwords_mock

Multi-line without exposing the port (you will need to docker inspect the IP)

    docker run --rm -ti --name=adwords_mock \
      -e MOCK_SERVER_PORT=3333 \
      elgalu/google_adwords_mock

### Push

    docker push elgalu/google_adwords_mock

### Tests
Test google for example

    export MOCK_SERVER_PORT=80 MOCK_SERVER_HOST=www.google.com SELENIUM_HUB_HOST=d.host.loc.dev
    ./test/python_test.py chrome

Test mock for example

    export MOCK_SERVER_PORT=33001 MOCK_SERVER_HOST=d.host.loc.dev SELENIUM_HUB_HOST=d.host.loc.dev
    ./test/python_test.py firefox

### Cleanup

    docker rm -vf adwords_mock
