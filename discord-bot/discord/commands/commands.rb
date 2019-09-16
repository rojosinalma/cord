module DiscordBot
  module Commands
    extend Discordrb::Commands::CommandContainer

    @admin_roles = []
    desc = "pong!"
    command :ping, description: desc do |event|
      "pong! (#{Time.now - event.timestamp}s)"
    end

    desc  = "Deletes X amount of messages from the channel"
    usage = "#{ENV['DISCORD_BOT_PREFIX']}prune <number>"
    command :prune, description: desc, usage: usage, allowed_roles: @admin_roles do |event, amount|
      amount = amount.to_i
      return "You can only delete between 1 and 100 messages!" if amount > 100

      event.channel.prune amount, true
      event.respond "Done pruning #{amount} messages 💥"
    end

    desc  = "Sends a message to the specified channel"
    usage = "#{ENV['DISCORD_BOT_PREFIX']}say #channel some message"
    command :say, min_args: 2, description: desc, usage: usage, allowed_roles: @admin_roles do |event, channel, *message|
      channel = channel.gsub("<#", "").to_i
      $bot.send_message channel, message.join(" ")
    end

    # This can be VERY dangerous in the wrong hands. Just allow the owner or very specific people to use it.
    command :eval, help_available: false do |event, *code|
      event.respond "Only the owner can do this" and break unless "#{event.user.id}" == ENV["DISCORD_OWNER_ID"]

      begin
        eval code.join(' ')
      rescue => e
        "Error 😭: ```#{e}```"
      end
    end

    # Meant to use locally only.
    command :debug, help_available: false do |event, *args|
      return "Nope!" unless ENV["BOT_ENV"] == "development"
      binding.pry
    end
  end
end
