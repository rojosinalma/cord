module Web
  module Helpers
    def protected!
      return if authorized?
      headers['WWW-Authenticate'] = 'Basic realm="Restricted Area"'
      halt 401, "Not authorized\n"
    end

    def authorized?
      @auth ||=  Rack::Auth::Basic::Request.new(request.env)

      @auth.provided? &&
      @auth.basic? &&
      @auth.credentials &&
      @auth.credentials == [configatron.web.user, configatron.web.password]
    end

    def restart_bot
      $bot.stop
      load './config/discord.rb'
      $bot.run configatron.discord.bot_mode
    end

    def set_bot_config(opts)
      configatron.discord.token      = opts['bot_token']
      configatron.discord.client_id  = opts['client_id']
      configatron.discord.bot_prefix = opts['bot_prefix']
    end
  end
end
