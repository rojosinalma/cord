module Cord
  module Commands
    extend Discordrb::Commands::CommandContainer

    # This can be VERY dangerous in the wrong hands. Just allow the owner or very specific people to use it.
    command :eval, help_available: false do |event, *code|
      event.respond "Only the owner can do this" and break unless "#{event.user.id}" == $owner_id

      begin
        eval code.join(' ')
      rescue => e
        "Error 😭: ```#{e}```"
      end
    end
  end
end
