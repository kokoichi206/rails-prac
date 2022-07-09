## Setup

1. build image

```
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
