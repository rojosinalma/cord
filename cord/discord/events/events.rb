module Cord
  module Events
    extend Discordrb::EventContainer

    ready do |event|
      event.bot.game = ENV['DISCORD_BOT_GAME']
    end
  end
end
