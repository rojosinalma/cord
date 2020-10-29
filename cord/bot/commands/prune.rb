module Cord
  module Commands
    extend Discordrb::Commands::CommandContainer

    desc  = "Deletes X amount of messages from the channel"
    usage = "#{$prefix}prune <number>"
    command :prune, description: desc, usage: usage, allowed_roles: @admin_roles do |event, amount|
      amount = amount.to_i
      return "You can only delete between 1 and 100 messages!" if amount > 100

      event.channel.prune amount, true
      event.respond "Done pruning #{amount} messages 💥"
    end
  end
end
