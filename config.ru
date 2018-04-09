# Main entrypoint. Things loaded here are available EVERYWHERE.
require 'rubygems'
require 'bundler'
require 'dotenv/load'
Bundler.require(:default, ENV["APP_ENV"] || "development") # At this point config.rb is not loaded yet and cannot be.

require_all 'config/config.rb', 'config/discord.rb'

$bot.run configatron.discord.bot_mode

unless configatron.app.disable_web
  require_all 'config/web.rb'
  ::Router.run!
end
