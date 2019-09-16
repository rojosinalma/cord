$LOAD_PATH.unshift(File.dirname(__FILE__))

$env = ENV["BOT_ENV"] || "development"

# Basic setup
require 'rubygems'
require 'bundler/setup'

Bundler.require(:default, $env.to_sym)
Dotenv.load if defined?(Dotenv)

# Config & Initializers
Dir[File.expand_path('config/initializers', __dir__) + '/**/*.rb'].each do |file|
  require file
end

# Bot & API stuff
require 'discord-bot/discord-bot'

# CommandBot  init
Thread.abort_on_exception = true
Thread.new do
  begin
    client = DiscordBot::CommandBot.client

    client.include! DiscordBot::Commands
    client.run unless ENV['NOBOT']
  rescue Exception => e
    STDERR.puts "ERROR: #{e}"
    STDERR.puts e.backtrace
    raise e
  end
end

# EventBot  init
Thread.abort_on_exception = true
Thread.new do
  begin
    client = DiscordBot::EventBot.client

    client.include! DiscordBot::Events
    client.run unless ENV['NOBOT']
  rescue Exception => e
    STDERR.puts "ERROR: #{e}"
    STDERR.puts e.backtrace
    raise e
  end
end


# API init
run DiscordBot::Web::Base unless ENV['NOWEB']
