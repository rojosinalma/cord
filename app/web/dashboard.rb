module Web
  class Dashboard < Sinatra::Base
    helpers Web::Helpers

    before '/*' do
      protected!
    end

    get '/dashboard' do
      erb :dashboard
    end

    post '/dashboard/config' do
      set_bot_config(params)
      restart_bot
      erb :dashboard
    end
  end
end
