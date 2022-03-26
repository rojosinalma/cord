# frozen_string_literal: true
source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'dotenv'
gem 'puma'
gem 'discordrb',       require: 'discordrb'
gem 'activesupport',   require: 'active_support/all'
gem 'sinatra',         require: 'sinatra/base'
gem 'sinatra-contrib'
gem 'github_api'
gem 'httparty'

group :development, :test do
  gem 'pry-byebug'
  gem 'rake'
  gem 'foreman'
end

group :test do
  gem 'rspec'
  gem 'rack-test'
  gem 'factory_bot'
end
