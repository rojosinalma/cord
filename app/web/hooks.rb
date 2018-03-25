module Web
  class Hooks < Sinatra::Base

    get '/webhooks' do
      "hello"
    end
  end
end
