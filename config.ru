# Main entrypoint. Things loaded here are available EVERYWHERE.

require     'rubygems'
require     'bundler'
require     'dotenv/load'
Bundler.require(:default, ENV["APP_ENV"] || "development")

require_all 'config'

unless configatron.web_only
  $bot.run configatron.discord_bot_mode
end

unless configatron.disable_web
  Web::Base.run!
end