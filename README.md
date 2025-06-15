# README

## Run the project

Have Docker installed and run the following command:

```bash
docker compose up -d
```

The project is configured to connect to the docker database and should work when running locally.

```bash
rails db:create
rails db:migrate
rails db:seed

rails server
```
