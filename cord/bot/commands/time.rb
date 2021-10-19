module Cord
  module Commands
    extend Discordrb::Commands::CommandContainer
    Discordrb::Commands::CommandAlias.new(:time, :tz)

    desc  = "R1SK timezones"
    usage = "#{$prefix}time"
    command :time, description: desc, usage: usage do |event, *args|
      time_gmt      = Time.now.getgm
      berlin_tz     = time_gmt.getlocal("+02:00").strftime("%d/%m/%Y - %H:%M (UTC%z)")
      santiago_tz   = time_gmt.getlocal("-03:00").strftime("%d/%m/%Y - %H:%M (UTC%z)")
      sydney_tz     = time_gmt.getlocal("+11:00").strftime("%d/%m/%Y - %H:%M (UTC%z)")

      event.channel.send_embed do |embed|
        embed.title = "**La hora exacta 🕰**"
        embed.colour = 0xcc0000
        embed.timestamp = Time.now

        embed.add_field(name: "🇩🇪 **Berlin**",   value: berlin_tz)
        embed.add_field(name: "🇨🇱 **Chile**", value: santiago_tz)
        embed.add_field(name: "🇦🇺 **Sydney**",   value: sydney_tz)
      end
    end
  end
end
