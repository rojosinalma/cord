require_relative 'events'

module DiscordBot
  class EventBot
    def self.client
      client ||=  Discordrb::Bot.new(
        token:       ENV["DISCORD_TOKEN"],
        ignore_bots: true
      )
    end
  end
end
