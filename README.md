# README

## Decision notes

- I used Docker Postgres DB because this is the most common database used in production.
- The project can be run locally not in a docker container because it makes debugging easier, but it is easy to run it in a container (Rails comes with a default Dockerfile).
- I switched testing to RSpec and FactoryBot because it is more commonly used than MiniTest.
- I named `Application` `JobApplication` so that the class name does not conflict with the Rails Application class.
- I used `before_commit` hooks not Database triggers for updating the mapping tables for simplicity. In Production, I would suggest using triggers. A more detailed explanation of this decision is in the `app/models/job/event.rb` file.

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

The following URLs are available:
http://127.0.0.1:3000/jobs.json
http://127.0.0.1:3000/job_applications.json

## Run tests

I included `Bullet` gem to prove that I don't have n+1 issues in the code.

```bash
rspec
```
