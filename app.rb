# Main entrypoint. Things loaded here are available EVERYWHERE.

require     'rubygems'
require     'bundler'
require     'dotenv/load'
Bundler.require(:default, ENV["APP_ENV"] || "development")

require_all 'config/*.rb'
require_all 'lib/*.rb'

$bot.run :async
