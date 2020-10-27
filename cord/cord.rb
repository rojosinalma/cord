require_relative 'discord/commands/command_bot'
require_relative 'discord/events/event_bot'
require_relative 'web/base'

module Cord
  $prefix   = ENV["DISCORD_BOT_PREFIX"]
  $bot_env  = ENV["BOT_ENV"]
  $owner_id = ENV["DISCORD_OWNER_ID"]
end
