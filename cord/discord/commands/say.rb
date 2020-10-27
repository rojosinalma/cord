module Cord
  module Commands
    extend Discordrb::Commands::CommandContainer

    desc  = "Sends a message to the specified channel"
    usage = "#{$prefix}say #channel some message"
    command :say, min_args: 2, description: desc, usage: usage, allowed_roles: @admin_roles do |event, channel, *message|
      channel = channel.gsub("<#", "").to_i
      event.bot.send_message channel, message.join(" ")
    end
  end
end
