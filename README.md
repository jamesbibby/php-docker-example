# php-docker-example
Sample compose configuration for a php application

## Application Code
Throw your application code in /app and your application will be available at: localhost:80/app when the container starts up.

## Makefile
A simple makefile has been included for automating the docker build.

The following will compile your docker container and tag it sample/php-app:latest
```bashp
make build
```

## Running your compose environment
You can bring up your compose environment with `docker-compose up -d` which will bring up all containers on a private network in a detached state (not attached to the terminal)  You can view the logs of one of your containers with `docker-compose logs php` or `docker-compose logs mysql`  if you want to follow the log you can add a `-f` flag like so `docker-compose logs -f php`

## MySQL Seed Data
This php setup uses a persistent volume so you data survives restarts.   The container maps a local data folder into the container so all data is saved.   If you want to clear all data simply shut down the container `docker-compose down` clear the folder and then `docker-compose up -d`

I put this together with an automatic seed data load.   If you place a file called `test_db.sql` in `./seed_data` it will be loaded on startup

You can access your database from outside the container on localhost:3306 due to the port mapping in docker-compose.yml and inside a container on mysql:3306

# Redis Instance
I included a redis server for fun, you can connect to it from outside the container on localhost:6379 and from inside a container at redis:6379

## Getting inside a container
To get into a shell in the container, you can run `docker-compose exec php-app sh`

## About Docker Compose v2
I use version 2, there is a newer version 3 but I don't know it as well :(
https://docs.docker.com/compose/compose-file/compose-file-v2

## About Dockerfiles
Here is a reference on the commands available to a Dockerfile.  Think of it as instructions on how to build the OS and the final image.   You can install things, copy files in, run commands, set variables.   Once your image is built, it is immutable.   Every time you start it up it will be the same.
https://docs.docker.com/engine/reference/builder/
