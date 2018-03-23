# Main entrypoint. Things loaded here are available EVERYWHERE.

require     'rubygems'
require     'bundler'
require     'dotenv/load'
Bundler.require(:default, ENV["RUBY_ENV"] || "development")

require_all 'config'
require_all 'lib'

$bot.run
