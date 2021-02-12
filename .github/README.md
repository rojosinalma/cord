Cord
--

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/rojosinalma/cord/tree/master)
[![Maintainability](https://api.codeclimate.com/v1/badges/5ebae31dbb5232744a4b/maintainability)](https://codeclimate.com/github/rojosinalma/cord/maintainability)
[![Join Discord](https://img.shields.io/badge/discord-join-7289DA.svg)](https://discord.gg/p8nnyNh)

### What is this?

Cord is a modular Discord bot skelleton which you can easily deploy and extend to your needs.

### Why?

Discordrb is currently very powerful, but doesn't provide with basic structure and tools to do efficient deployments to either Heroku or other cloud services.

This project uses Discordrb for all things Discord and Sinatra to have a web panel where you can configure some settings.

Sinatra is not completely necessary, but if you want to deploy to Heroku (or some other cloud service that requires you to bind to a port), you'll need it. It's also a nice option in case you wanna interact with your bot from outside discord through webhooks.

### How?

You deploy the bot and extend it with your own commands or events. I assume you know how to code in Ruby and you've done your homework with Discordrb.

## I will not teach you how to code commands or events, neither teach you how to code in Ruby

## Dependencies:

  * Ruby 2.6+
  * Same requirements as [Discordrb](https://github.com/meew0/discordrb)

## Configuration:

- Rename/duplicate the `.env.example` to `.env` and add all your keys there.

## Usage:

```bash
    $ bundle exec rackup
```

If you want to run this without the web overhead:

```ruby
  NOWEB=true bundle exec rackup
```

Or without the bot itself:

```ruby
  NOBOT=true bundle exec rackup
```

## Contribute

1. Fork it
2. Change it
3. Push it
4. Create the PR
5. Ping me :D


