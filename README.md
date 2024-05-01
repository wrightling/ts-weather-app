# Weather App
## Assumptions
## Implementaion Details
### WeatherApi
Simple API wrapper for the Visual Crossing Timeline Weather API. API Key is handled via environment variables in production and via .env file in development and test.

Implemented as a module as no object instance is needed or desired, with a simple configuration singleton used to hold API configuration details (base URI and API key).

Errors thrown here are customized in the ApiExceptions module.
## Weather API Details
Visual Crossing's [Timeline Weather API](https://www.visualcrossing.com/resources/documentation/weather-api/timeline-weather-api/).

An API key is required for use. See [Local Environment Setup](#local-environment-setup) below.
## What I would do given more time
Flesh out the ApiExceptions module further and delineate common errors further.

Move the response from WeatherApi::Client.weather_info into a class with helper methods so it can be more readably interrogated in views.

Flesh out the views to show more detailed weather information. The information coming back from the Timeline Weather API is extensive.

Implement client-side validations on the form inputs (city, state, zip) to make sure enough data is present and in a reasonable format. Additionally could allow more specific address information, such as street and country.
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