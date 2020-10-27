require_relative 'endpoints/endpoints'

module Cord
  module Web
    class Base < Sinatra::Base
      configure :production, :development do
        enable :logging
      end

      get '/' do
        'I\'m alive!'
      end

      not_found do
        404
      end
    end
  end
end
