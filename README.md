# Symfony docker image 

[![Docker Automated build](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)](https://hub.docker.com/r/gerardojunior/symfony.environment)

Docker image to run [symfony](https://symfony.com/) framework

> The project must be in the **/usr/local/src** (with "public" folder) folder container folder and will be available on port **:80** of the container

## Tags available

- stable
  - [php](https://php.net): 7.2.5 
  - [apache](https://www.apache.org/): 2.4.33
  - [composer](https://getcomposer.org/): 1.6.5
  - [xdebug](https://xdebug.org/): 2.6.0 **only by rebuilding with arg DEBUG=true*
- latest
  - [php](https://php.net): 7.2.5 
  - [apache](https://www.apache.org/): 2.4.33
  - [composer](https://getcomposer.org/): 1.6.5
  - [xdebug](https://xdebug.org/): 2.6.0 **only by rebuilding with arg DEBUG=true*

## Come on, do your tests

```bash
docker pull gerardojunior/symfony.environment:stable
```
## How to build

to build the image you need install the [docker engine](https://www.docker.com/) only

*~ You can try building with different versions of software with docker args, for example: PHP_VERISON=7.2.5 ~*
```bash
git clone https://github.com/gerardo-junior/symfony.environment.git
cd symfony.environment
docker build . --tag gerardojunior/symfony.environment
```
*~ you can install with [xdebug](https://xdebug.org/) with the argument: DEBUG=true ~*

## How to use

##### Only with docker command:

```bash
# in your project folder
docker run -it --rm -v $(pwd):/usr/share/src -p 1234:80 gerardojunior/symfony.environment:stable [command]
```
##### With [docker-compose](https://docs.docker.com/compose/)

Create the docker-compose.yml file  in your project folder with:

```yml
# (...)

  api: 
    image: gerardojunior/symfony.environment:stable
    restart: on-failure
    volumes:
      - type: bind
        source: ./
        target: /usr/share/src
    ports:
      - 1234:80

# (...)
```

## How to enter image shell
 
```bash
docker run -it --rm gerardojunior/symfony.environment:stable /bin/sh

# or with docker-compose

docker-compose run api /bin/sh
```

### License  
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
