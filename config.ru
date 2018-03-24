# Main entrypoint. Things loaded here are available EVERYWHERE.

require     'rubygems'
require     'bundler'
require     'dotenv/load'
Bundler.require(:default, ENV["APP_ENV"] || "development")

require_all 'config'
require_all 'lib'

async = ENV["NO_WEBHOOKS"] ? nil : :async

$bot.run async
run Sinatra::Webhooks unless ENV["NO_WEBHOOKS"]
