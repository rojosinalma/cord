require_relative 'bot/commands/command_bot'
require_relative 'bot/events/event_bot'
require_relative 'web/base'

module Cord
  $prefix   = ENV["DISCORD_BOT_PREFIX"]
  $owner_id = ENV["DISCORD_OWNER_ID"]
end
