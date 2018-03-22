module DiscordEvents
  extend Discordrb::EventContainer

  ready do |event|
    event.bot.game = CONFIG["game"]
  end
end
