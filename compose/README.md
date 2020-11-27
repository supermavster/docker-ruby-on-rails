# Generate a new project

1. Go to folder source `cd source`
2. Execute the next command:

    ```sh
    docker-compose run --rm ruby rails new . --force --database=postgresql
    ```

3. Run the migrations to connect the DB

    ```sh
    docker-compose run --rm ruby rails db:create
    ```

**Note:** Check the file `source/config/database.yml`

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
