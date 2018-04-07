module Web
  class Dashboard < Sinatra::Base
    helpers Web::Helpers

    before '/*' do
      protected!
    end

    get '/dashboard' do
      erb :dashboard, :layout => :page
    end

    post '/dashboard/config' do
      set_bot_config(params)
      restart_bot
      erb :dashboard, :layout => :page,
          :locals => { :success => true }
    end
  end
end
