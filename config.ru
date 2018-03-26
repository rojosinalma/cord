# Main entrypoint. Things loaded here are available EVERYWHERE.

require     'rubygems'
require     'bundler'
require     'dotenv/load'
Bundler.require(:default, ENV["APP_ENV"] || "development")

require_all 'config'

unless ENV["WEB_ONLY"]
  $bot.run configatron.discord_bot_mode
end

unless configatron.disable_web
  configatron.basic_auth_user = ENV["BASIC_AUTH_USER"] || false
  configatron.basic_auth_pass = ENV["BASIC_AUTH_PASS"] || false
  Web::Base.run! unless configatron.disable_web
end