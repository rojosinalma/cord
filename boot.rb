require 'pry'
require 'discordrb'

Dir["#{File.dirname(__FILE__)}/app/**/*.rb"].each {|file| require file }

CONFIG = YAML.load_file 'config/settings.yml'

bot = Discordrb::Commands::CommandBot.new(
  token:       CONFIG["token"],
  client_id:   CONFIG["client_id"],
  prefix:      CONFIG["prefix"],
  ignore_bots: true
)

bot.include! DiscordEvents
bot.include! DiscordCommands
bot.include! FunCommands
bot.run

