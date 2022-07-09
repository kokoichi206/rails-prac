## Setup

1. build image

```sh
docker-compose build
```

2. install Rails7

```sh
# into the container
docker-compose run app sh

# in container
gem i -v 7.0 rails
rails new . -d mysql
```

3. rewrite docker files
4. rebuild image

```sh
docker-compose build
```

5. run server

```sh
docker-compose up
```
