module Discord
  module Commands
    extend Discordrb::Commands::CommandContainer

    desc = "pong!"
    command :ping, description: desc do |event|
      "pong! (#{Time.now - event.timestamp}s)"
    end

    command :debug, help_available: false do |event, *args|
      # binding.pry
    end

    command :prune, help_available: false do |event, amount|
      # binding.pry
    end

    roles = [""]
    command :say, help_available: false, min_args: 2, required_roles: roles do |event, channel, *message|

      channel = channel.gsub("<#", "").to_i
      $bot.send_message channel, message.join(" ")
    end

    command :eval, help_available: false do |event, *code|
      event.respond "Only the owner can do this" and break unless "#{event.user.id}" == configatron.discord_owner_id

      begin
        eval code.join(' ')
      rescue => e
        "Error 😭: ```#{e}```"
      end
    end
  end
end
