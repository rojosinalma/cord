module Cord
  module Events
    extend Discordrb::EventContainer

    ready do |event|
      event.bot.game = ENV['DISCORD_BOT_GAME']
      $logger.info "Bot ready!"
    end

    channel_update do |event|
      # Channel filter
      channel_name = ($env == "development") ? "droid-bay" : "helm"
      if event.channel.name == channel_name

        begin
          $logger.info "Change detected in ##{channel_name}"
          last_entry = event.server.audit_logs.entries.select{|entry| (entry.action_type == :update) && entry.target_type == :channel}.first

          # Audit log filter
          return unless event.channel.name == last_entry.target.name
          # Fetch info from Discord
          #raise("First letter is not R") if event.channel.topic.chars[0] == "R"
          event_topic = event.channel.topic
          audit_user  = last_entry.user
          audit_date  = last_entry.creation_time

          # Fetch names from GH repo.
          res          = Github.repos.contents.get 'R1sk-Org', 'R1SK', 'names.json'
          content      = JSON.parse(Base64.decode64(res.body.content))
          content_hash = content.kind_of?(Hash) ? content : Hash.new

          raise("Empty names.json") if content_hash.fetch('names', []).last.nil?

          last_topic   = content_hash['names'].last['name'] unless content_hash.fetch('names', []).last.nil?


          # Save to Github
          unless (event_topic == last_topic)
            updated_content = content_hash['names'].push({ "name" => event_topic, "author" => audit_user.username, "date" => audit_date.strftime("%m/%d/%Y") })
            content         = { names: updated_content }

            $logger.info("DEBUG INFO: event_topic: #{event_topic} | audit_user: #{audit_user.username} | date: #{audit_date.strftime("%m/%d/%Y")}")

            Github.repos.contents.update('R1SK-Org', 'R1SK', 'names.json', path: 'names.json', content: content.to_json, message: "New topic from Discord", sha: res.body.sha )
          end

        rescue => e
          $logger.error "Catched error: #{e.message}"
          # Fail semi-silently
        end
      end

      $logger.info "Change detected outside of ##{channel_name}, ignored"
    end
  end
end
