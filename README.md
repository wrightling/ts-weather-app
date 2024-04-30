# Weather App
## Assumptions
## Implementaion Details
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