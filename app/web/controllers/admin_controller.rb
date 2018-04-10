module Web
  class AdminController < Base
    namespace '/admin' do
      before '/*' do
        protected!
      end

      get '/dashboard' do
        erb :'admin/dashboard', layout: :application
      end

      post '/config' do
        halt 401 unless session[:authorized]
        set_bot_config(params)
        restart_bot
        redirect_to '/dashboard'
      end
    end
  end
end
