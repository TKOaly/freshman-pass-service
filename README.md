# Fresher pass

Fresher pass for the new students to compete on collecting points from events and tasks.

## Initial setup
```
docker-compose build
docker-compose run --rm web bin/rails db:setup && bin/rails db:seed
```

## Running the app
```
docker-compose up
```

## Running the Rails console
When the app is already running with `docker-compose` up, attach to the container:
```
docker-compose exec web bin/rails c
```

When no container running yet, start up a new one:
```
docker-compose run --rm web bin/rails c
```

## Running tests
```
docker-compose run --rm web bin/rspec
```

## Creating admin account
In rails console run
```
user = User.create(username: "Username", first_name: "First name", last_name: "Last name", irc_nick: "Irc or Telegram nick", email: "email@example.com", password: "Password", password_confirmation: "Password", confirmed_at: Date.today, privacy_policy_consent: true)
user.add_role 'admin'
```

