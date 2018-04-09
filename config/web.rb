# This is a hacky way to have the "router" be the main app and then inject other controllers into it.
# So we can create an inheritance scheme where all controllers are children of the ApplicationController
# and Router acts as a glue between all of them. reference: https://github.com/sinatra/sinatra/issues/693
Router = Sinatra.new

require     'sinatra/namespace'
require_all 'app/web/helpers/*.rb'
require_all 'app/web/*.rb'
require_all 'app/web/controllers/*.rb'
