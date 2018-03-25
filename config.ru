# Main entrypoint. Things loaded here are available EVERYWHERE.

require     'rubygems'
require     'bundler'
require     'dotenv/load'
Bundler.require(:default, ENV["APP_ENV"] || "development")

require_all 'config'

$bot.run configatron.discord_bot_mode
Web::Base.run! unless configatron.disable_web
