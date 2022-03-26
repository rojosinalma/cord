module RSI
  class API
    include HTTParty

    RSI_API_KEY = ENV["RSI_API_KEY"]
    base_uri "api.starcitizen-api.com/#{RSI_API_KEY}"

    def user(username)
      self.class.get("/v1/auto/user/#{username}")
    end
  end
end
