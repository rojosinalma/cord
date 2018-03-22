module DiscordCommands
  extend Discordrb::Commands::CommandContainer

  command :ping do |_event|
    "Pong!"
  end

  command :debug do |event|
    binding.pry
  end
end
