# Docker - Ruby on Rails

A pretty simplified Docker Compose workflow that sets up (Ruby, Redis, PostgreSQL) network of containers for local ruby development.

![Docker](https://github.com/supermavster/docker-ruby-on-rails/workflows/Docker/badge.svg)

![Image](https://repository-images.githubusercontent.com/316348462/1674a100-3093-11eb-8f21-d89e025b637b)

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
   git clone https://github.com/supermavster/docker-ruby-on-rails.git
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
# Develop Mode
RAILS_ENV=development

# Postgres
POSTGRES_HOST_AUTH_METHOD=trust

# Database Env
DATABASE_NAME=rails_development
DATABASE_USER=supermavster
DATABASE_PASSWORD=password
DATABASE_HOST=database

# Redis data
REDIS_HOST=redis
```

```dotenv
# source/.env
# Develop Mode
RAILS_ENV=development

# Postgres
POSTGRES_HOST_AUTH_METHOD=trust

# Database Env
DATABASE_NAME=rails_development
DATABASE_USER=supermavster
DATABASE_PASSWORD=password
DATABASE_HOST=database

# Redis data
REDIS_HOST=redis
```

The only change is the `DB_HOST` in the `source/.env` where is called to the container of `database`:

```dotenv
# source/.env
DB_HOST=database
```

Please check the file `database.yml` with the next values:

```yml
default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  host: database
  username: postgres
  password: 

development:
  <<: *default
  adapter: postgresql
  encoding: unicode
  database: rails_development
  username: postgres 
  password: password
  pool: 5
  host: database
  
```

---

## Special Cases

To Down and remove the volumes we use the next command:

```sh
docker-compose down -v
```
