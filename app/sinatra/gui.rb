require 'erb'

module Sinatra
  class WebGui < Sinatra::Base
    set :public_folder, File.dirname(__FILE__) + '/public'
    get '/config' do
      erb :config
    end
    post '/config' do
      configatron.discord_token      = params['bot_token']
      configatron.discord_client_id  = params['client_id']
      configatron.discord_bot_prefix = params['bot_prefix']
      $bot.stop
      require_rel '../lib/discord.rb'
      erb :config
      async = ENV["NO_WEBHOOKS"] ? nil : :async
      $bot.run async
    end
  end
end
