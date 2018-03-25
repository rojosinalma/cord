module Web
  class Dashboard < Sinatra::Base

    get '/dashboard' do
      erb :dashboard
    end

    post '/dashboard/config' do
      setopts(params)
      restart_bot
      erb :dashboard
    end

    private

    # TODO: Move to helper
    def restart_bot
      $bot.stop
      load './config/discord.rb'
      $bot.run configatron.discord_bot_mode
    end

    def setopts(opts)
      configatron.discord_token      = opts['bot_token']
      configatron.discord_client_id  = opts['client_id']
      configatron.discord_bot_prefix = opts['bot_prefix']
    end
  end
end
