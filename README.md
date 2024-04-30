# Weather App
## Assumptions
## Implementaion Details
## Weather API Details
Visual Crossing's [Timeline Weather API](https://www.visualcrossing.com/resources/documentation/weather-api/timeline-weather-api/).

An API key is required for use. See [Local Environment Setup](#local-environment-setup) below.
## Local Environment Setup
Run and test locally using docker-compose, which relies on the Dockerfile.dev dockerfile.
```
docker-compose build
docker-compose run --rm rails-app bundle install
docker-compose up
```
`docker-compose up` starts the rails server. Visit http://localhost:3001 to test.

To Stop the server, open a second terminal window to the same directory:
```
docker-compose down
```
Create a free account with [Visual Crossing](https://www.visualcrossing.com/sign-up). The associated API key can be found on the [account details page](https://www.visualcrossing.com/account).

Add the API key to a .env file in the rails app directory.
```
echo "WEATHER_API_KEY={API key associated with your account}" > .env
```
This will give rails access to your API key without exposing it to github or to the command line history.