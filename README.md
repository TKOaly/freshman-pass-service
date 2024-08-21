# Fresher pass

Fresher pass for the new students to compete on collecting points from events and tasks.

## Initial setup

```bash
docker compose build
docker compose run --rm web rails db:setup && rails db:seed
```

## Running the app

```bash
docker compose up
```

## Running the Rails console

When the app is already running with `docker compose` up, attach to the container:

```bash
docker compose exec web rails c
```

When no container running yet, start up a new one:

```bash
docker compose run --rm web rails c
```

## Running tests

```bash
docker compose run --rm web bundle exec rspec
```

## Adding new dependencies

After adding new dependency to Gemfile, run

```bash
docker compose run --rm web bundle install
```

## Creating admin account

In rails console run

```ruby
user = User.create(username: "username", first_name: "First name", last_name: "Last name", irc_nick: "Irc or Telegram nick", email: "email@example.com", password: "password", password_confirmation: "password", confirmed_at: Date.today, privacy_policy_consent: true)
user.add_role 'admin'
```
