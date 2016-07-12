# Google_Adwords_Mock
Mock of http://www.google.com/adwords/ for testing

## Contributing

### Build

    docker build -t elgalu/google_adwords_mock .

### Run

    docker run --rm -ti --name=adwords_mock \
      -e MOCK_SERVER_PORT=3333 \
      elgalu/google_adwords_mock

One liner and exposing the port

    docker run --rm -ti --name=adwords_mock -p 33001:33001 elgalu/google_adwords_mock

### Push

    docker push elgalu/google_adwords_mock

### Cleanup

    docker rm -vf adwords_mock
