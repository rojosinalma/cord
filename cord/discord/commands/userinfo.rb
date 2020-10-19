module Cord
  module Commands
    extend Discordrb::Commands::CommandContainer

    # Meant to use locally only.
    command :userinfo, help_available: false do |event, *args|
      event.respond "Ah Ah Ah! you didn't say the magic word!\n (No eris admin sapo ql y la ctm teoiasacarlachucha)" and break unless "#{event.user.id}" == $owner_id

      mention_id = args.first.to_id
      if event.server.members.include? mention_id
        member = event.server.members.select { |member| member.id == mention_id}.first
      else
        "Member not found!"
        return
      end

      event.channel.send_embed do |embed|
        embed.title = "**#{member.display_name}**"
        embed.colour = 0xcc0000
        embed.timestamp = Time.now

        embed.add_field(name: "Server ID",  value: "#{member.id}")
        embed.add_field(name: "Discord ID", value: "#{member.username}##{member.discriminator}")
        embed.add_field(name: "Joined at",  value: "#{member.joined_at.strftime('%D %H:%M:%S')}")
        embed.add_field(name: "Roles",      value: "#{member.roles.collect(&:name).join(', ')}")
        embed.add_field(name: "Admin",      value: "#{member.roles.collect{|role| role.permissions.administrator}.any?}")
      end
    end
  end
end
