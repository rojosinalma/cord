module Cord
  module Commands
    extend Discordrb::Commands::CommandContainer

    desc = "pong!"
    command :ping, description: desc do |event|
      "pong! (#{Time.now - event.timestamp}s)"
    end
  end
end
