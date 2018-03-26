module Web
  class Hooks < Sinatra::Base
    helpers Web::Helpers

    get '/webhooks' do
      "hello"
    end
  end
end
