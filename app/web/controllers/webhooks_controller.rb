module Web
  class Webhooks < Base
    namespace '/webhooks' do
      get '/test' do
        "hello"
      end
    end
  end
end
