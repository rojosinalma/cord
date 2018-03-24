require_all 'app/sinatra/**/*.rb'

configure :production, :development do
  set :port, configatron.app_port
end
