# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

gem 'aws-sdk-s3', require: false
gem 'bootsnap', '>= 1.4.2', require: false # Reduces boot times through caching; required in
# config/boot.rb
gem 'contentful'
gem 'devise' # Devise is a flexible authentication solution for Rails based on Warden
gem 'friendly_id' # FriendlyId is the "Swiss Army bulldozer" of slugging and permalink plugins for
# Active Record.
gem 'image_processing' # Use Active Storage variant
gem 'jbuilder', '~> 2.11' # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'pg'
gem 'puma', '~> 5.4' # Use Puma as the app server
gem 'rails', '~> 6.1.4'
gem 'recaptcha' # This gem provides helper methods for the reCAPTCHA API
gem 'redis'
gem 'rich_text_renderer'
gem 'sass-rails', '>= 6' # Use SCSS for stylesheets
gem 'sidekiq'
gem 'sitemap_generator' # SitemapGenerator is the easiest way to generate Sitemaps in Ruby. Rails
# integration provides access to the Rails route helpers within your sitemap config file and
# automatically makes the rake tasks available to you.
gem 'turbolinks', '~> 5' # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'view_component'
gem 'webpacker', '~> 5.4' # Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'whenever'

group :development, :test do
  gem 'brakeman'
  gem 'byebug', platforms: %i[mri mingw x64_mingw] # Call 'byebug' anywhere in the code to stop
  # execution and get a debugger console
  gem 'rubocop'
  gem 'rubocop-faker'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
end

group :development, :staging, :test do
  gem 'faker'
end

group :development do
  gem 'annotate'
  gem 'listen', '~> 3.8'
  gem 'pry-rails'
  gem 'rails-erd'
  gem 'spring' # Spring speeds up development by keeping your application running in the background.
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0' # Access an interactive console on exception pages or by calling
  # 'console' anywhere in the code.
end

group :test do
  gem 'capybara', '>= 2.15' # Adds support for Capybara system testing and selenium driver
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
  gem 'rspec-core'
  gem 'rspec-expectations'
  gem 'rspec-mocks'
  gem 'rspec-rails' # Rspec-rails brings the RSpec testing framework to Ruby on Rails as a drop-in
  # alternative to its default testing framework, Minitest.
  gem 'rspec-support'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '~> 5.0'
  gem 'simplecov'
  gem 'webdrivers' # Easy installation and use of web drivers to run system tests with browsers
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
