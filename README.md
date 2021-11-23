# Who 'Dat?

Who 'Dat? is simple game to help you get to know the people on your team.

It parses the data in a "Who's Who" Trello board which must be constructed as follows:

* A list for each team. The title of the list is the team name
* A card for each person, with their headshot as a cover image. The title of the card should be in the form "Full Name [Role Title]"

![Example Who's Who board](trello.png)

## Setting up your dev environment

Who 'Dat? is a straightforward Rails app.

### Set up the Rails app

Check out the repo then install the required gems:

```bash
gem install bundler
bundle install
```

Next, set up the database:

```bash
bundle exec rails db:create
bundle exec rails db:reset
```

### Configure Trello

You need to configure the app with Trello credentials.

First [obtain your API keys](https://trello.com/app-key) from your Trello account.

Next, add the keys to your Rails credentials (using `bin/rails credentials:edit`):

```yaml
trello:
  api_key: [YOUR API KEY]
  token: [YOUR API TOKEN]
```

### Configure Google Sign In

You need to configure the app with Google creds.

Follow the instructions in the [Basecamp Ruby gem README](https://github.com/basecamp/google_sign_in) to get your app keys, then add them to your Rails credentials:

```yaml
google_sign_in:
  client_id: [YOUR CLIENT ID]
  client_secret: [YOUR CLIENT SECRET]
```

### Import the data from Trello into the database

You will need to run this regularly to keep the database in sync with Trello.

```bash
bundle exec rake trello:load_people
```

## Running the app

To run the app:

```bash
bundle exec rails server
```

You can view the app at http://localhost:3000. You'll need to log in via Google to play.
