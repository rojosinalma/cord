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
        set_bot_config(params)
        restart_bot

        erb :'admin/dashboard',
          layout: :application,
          locals: { success: true }
      end
    end
  end
end
