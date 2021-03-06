Dir[File.join(__dir__, '*.rb')].each { |file| require file }

module Cord
  class CommandBot
    def self.client
      client ||= Discordrb::Commands::CommandBot.new(
        token:     ENV["DISCORD_TOKEN"],
        client_id: ENV["DISCORD_CLIENT_ID"],
        prefix:    ENV["DISCORD_BOT_PREFIX"]
      )
    end
  end
end
