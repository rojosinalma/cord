Ruby Discord Bot
--

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/elfenars/ruby-discord-bot/tree/master)
[![Maintainability](https://api.codeclimate.com/v1/badges/5ebae31dbb5232744a4b/maintainability)](https://codeclimate.com/github/elfenars/ruby-discord-bot/maintainability)
[![Dependency Status](https://gemnasium.com/badges/github.com/elfenars/ruby-discord-bot.svg)](https://gemnasium.com/github.com/elfenars/ruby-discord-bot)
[![Join Discord](https://img.shields.io/badge/discord-join-7289DA.svg)](https://discord.gg/p8nnyNh)

You can take this as a skelleton for future discord bots made in Ruby.

Discordrb is currently very powerful, but doesn't provide with basic structure and tools to do efficient deployments to either Heroku or other cloud services.

It doesn't provide tools for easy development of bots either, so the point here is to try to minimize that hassle and just clone this repo and start coding your bot commands.

This repo contains Discordrb and Sinatra. Sinatra is not completely necessary, but if you want to deploy to Heroku (or some other cloud service that requires you to bind to a port), you'll need it. It's also a nice option in case you wanna interact with your bot from outside discord through webhooks.

## Dependencies:

  * Ruby 2.x
  * Same requirements as [Discordrb](https://github.com/meew0/discordrb)

## Configuration:

Rename/duplicate the `.env.example` to `.env` and add all your keys there.

```
DISCORD_TOKEN= # get it from https://discordapp.com/developers/
DISCORD_CLIENT_ID= # get it from https://discordapp.com/developers/
DISCORD_OWNER_ID= # get it from https://discordapp.com/developers/
DISCORD_BOT_PREFIX= # prefix your bot will use for commands
DISCORD_BOT_GAME= # some text to show under the bots name. i.e: "Playing <sometext>"
APP_ENV= #development by default, switch to "production", "staging", etc as needed

```

## Usage:

```bash
    $ rackup -p $PORT
```

If you want to run this without the webhooks overhead:

```ruby
  DISABLE_WEB=true ruby app.rb
```

For easier development you can use `rerun` and reload the app whenever files change inside the `app/` folder.

```ruby
  DISABLE_WEB=true rerun ruby app.rb
```

## Contribute

1. Fork it
2. Change it
3. Push it
4. Create the PR
5. Ping me :D


