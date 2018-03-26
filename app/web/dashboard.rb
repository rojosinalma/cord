module Web
  class Dashboard < Sinatra::Base

    # From Sinatra FAQ
    helpers do
      def protected!
        return if authorized?
        headers['WWW-Authenticate'] = 'Basic realm="Restricted Area"'
        halt 401, "Not authorized\n"
      end

      def authorized?
        @auth ||=  Rack::Auth::Basic::Request.new(request.env)
        @auth.provided? and
            @auth.basic? and
            @auth.credentials and
            @auth.credentials == [configatron.basic_auth_user || 'admin',
                                  configatron.basic_auth_pass || 'admin']
      end
    end

    get '/dashboard' do
      protected!
      erb :dashboard
    end

    post '/dashboard/config' do
      protected!
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
