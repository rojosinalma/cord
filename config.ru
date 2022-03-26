$LOAD_PATH.unshift(File.dirname(__FILE__))
$env = ENV["BOT_ENV"] || "development"
$stdout.sync = true

# Basic setup
require 'rubygems'
require 'bundler/setup'
require 'logger'

$logger       = Logger.new(STDOUT)
$logger.level = Logger::DEBUG

Bundler.require(:default, $env.to_sym)
Dotenv.load if defined?(Dotenv)

# Config & Initializers
$LOAD_PATH.unshift File.expand_path('lib')
Dir.glob('config/initializers/**/*.rb').sort.each { |path| require(path) }

# Bot & API stuff
require 'cord/cord'

# CommandBot  init
$logger.info "* Starting CommandBot thread"

Thread.abort_on_exception = true
Thread.new do
  begin
    client = Cord::CommandBot.client

    client.include! Cord::Commands
    client.run
  rescue Exception => e
    $logger.error "ERROR: #{e}"
    $logger.error e.backtrace
    raise e
  end
end

# EventBot  init
$logger.info "* Starting EventBot thread"

Thread.abort_on_exception = true
Thread.new do
  begin
    client = Cord::EventBot.client

    client.include! Cord::Events
    client.run
  rescue Exception => e
    $logger.error "ERROR: #{e}"
    $logger.error e.backtrace
    raise e
  end
end

# API init
run Cord::Web::Base
