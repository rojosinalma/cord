module Cord
  module Commands
    extend Discordrb::Commands::CommandContainer

    # Meant to use locally only.
    command :debug, help_available: false do |event, *args|
      return "Nope!" unless $bot_env == "development"
      binding.pry
    end
  end
end
