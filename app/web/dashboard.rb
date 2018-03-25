module Web
  class Dashboard < Sinatra::Base

    get '/dashboard' do
      erb :dashboard
    end

    post '/dashboard/config' do
      configatron.discord_token      = params['bot_token']
      configatron.discord_client_id  = params['client_id']
      configatron.discord_bot_prefix = params['bot_prefix']
      $bot.stop
      erb :config
      async = ENV["NO_WEBHOOKS"] ? nil : :async
      $bot.run async
    end
  end
end
