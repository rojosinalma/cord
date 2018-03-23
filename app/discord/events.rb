module Discord
  module Events
    extend Discordrb::EventContainer

    ready do |event|
      event.bot.game = configatron.discord_bot_game
    end
  end
end
