require 'rsi/api'

module Cord
  module Commands
    extend Discordrb::Commands::CommandContainer


    rsi ||= RSI::API.new
    desc = "Find user in Star Citizen"
    command :rsi, description: desc do |event, *args|
      event.respond "Chupalo, no te escucho lalalalala" and break unless "#{event.user.id}" == $owner_id
      return "Nope!" unless $env == "development"

      binding.pry
      case args[1]
      when "user"
        event.respond "No user provided 🧐, I'm a bot not a fucking psychic..." and break unless !!args[1]

        userinfo = rsi.user(args[1])
        data     = userinfo["data"].with_indifferent_access

        event.channel.send_embed do |embed|
          embed.title     = "UEEE Citizen Record #{data[:profile][:id]}"
          embed.colour    = 0x29ef45
          embed.url       = data[:profile][:page][:url]
          embed.image     = Discordrb::Webhooks::EmbedImage.new(url: data[:organization][:image])
          embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url: data[:profile][:image])

          embed.add_field(name: "Name",                          value: data[:profile][:display])
          embed.add_field(name: "Handle Name",                   value: data[:profile][:handle])
          embed.add_field(name: "Country",                       value: data[:profile][:location][:coutry], inline: true)
          embed.add_field(name: "Region",                        value: data[:profile][:location][:region], inline: true)
          embed.add_field(name: "Main Organization",             value: data[:organization][:name])
          embed.add_field(name: "Spectrum Identification (SID)", value: data[:organization][:sid], inline: true)
          embed.add_field(name: "Organization Rank",             value: data[:organization][:rank], inline: true)
        end
      else
        event.respond "That's not a valid option, genius :tada:"
      end
    end
  end
end
