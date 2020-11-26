# Docker - Ruby on Rails

A pretty simplified Docker Compose workflow that sets up (Ruby, Redis, PostgreSQL) network of containers for local ruby development.

## Ports

Ports used in the project:
| Software | Port |
|-------------- | -------------- |
| **ruby** | 3000 |
| **postgre** | 5432 |
| **redis** | 6379 |

## Use

To get started, make sure you have [Docker installed](https://docs.docker.com/) on your system and [Docker Compose](https://docs.docker.com/compose/install/), and then clone this repository.

1. Clone this project:

   ```sh
   git clone https://github.com/supermavster/docker-ruby.git
   ```

2. Inside the folder `docker-ruby` and Generate your own `.env` to docker compose with the next command:

   ```sh
   cp .env.example .env
   ```

3. You need **Create** or **Put** your laravel project in the folder source; to create follow the next instructions [Here](source/README.md).

4. Build the project whit the next commands:

   ```sh
   docker-compose up --build
   ```

---

## Remember

The configuration of the database **must be the same on both sides** .

```dotenv
# .env
DATABASE_NAME=rails_development
DATABASE_USER=supermavster
DATABASE_PASSWORD=password
DATABASE_HOST=database
REDIS_HOST=redis
```

```dotenv
# source/.env

```

The only change is the `DB_HOST` in the `source/.env` where is called to the container of `mysql`:

```dotenv
# source/.env
DB_HOST=mysql
```

---

## Special Cases

To Down and remove the volumes we use the next command:

```sh
docker-compose down -v
```
