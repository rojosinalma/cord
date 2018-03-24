Ruby Discord Bot
--

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/elfenars/ruby-discord-bot/tree/master)

You can take this as a skelleton for future discord bots made in Ruby.

Discordrb is currently very powerful, but doesn't provide with basic structure and tools to do efficient deployments to either Heroku or other cloud services.

It doesn't provide tools for easy development of bots either, so the point here is to try to minimize that hassle and just clone this repo and start coding your bot commands.

This repo contains Discordrb and Sinatra. Sinatra is necessary to be able to bind a port to the app (i.e: when deploying to Heroku) or just because you want to have a web interface with some webhooks or even views to interact with the bot outside discord.

## Dependencies:

  * Ruby 2.X
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
  NO_WEBHOOKS=true ruby app.rb
```

For easier development you can use rerun and reload your client whenever files change inside the `app/` folder.

```ruby
  NO_WEBHOOKS=true rerun ruby app.rb
```

## Contribute

1. Fork it
2. Change it
3. Push it
4. Create the PR
5. Ping me :D


