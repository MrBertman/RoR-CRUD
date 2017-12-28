source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.3.3'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.3'
# Use sqlite3 as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'devise'
gem 'bcrypt', platforms: :ruby # gem uninstall bcrypt gem uninstall bcrypt-ruby gem install bcrypt --platform=ruby
gem 'devise-i18n'
gem 'sidekiq', '~> 5.0'
#gem 'redis', '~> 4.0'
gem 'redis-rails', '~> 5.0'
gem 'redis-activesupport', '~> 5.0'

gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'bootstrap', '~> 4.0.0.beta2.1'
gem 'bootstrap-datepicker-rails', '~> 1.7', '>= 1.7.1.1'
gem 'rspec', '~> 3.7'
gem 'simplecov', '~> 0.15.1'
gem 'rails-controller-testing'
gem 'elasticsearch', '~> 6.0'
gem 'elasticsearch-rails', '~> 5.0'
gem 'elasticsearch-model', '~> 5.0'
gem 'rspec-mocks', '~> 3.7'
gem 'rspec-activemodel-mocks', '~> 1.0'
gem 'mocha', '~> 1.3'
#gem 'factory_bot_rails', '~> 4.8', '>= 4.8.2'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
require 'rbconfig'
gem 'wdm', '>= 0.1.0' if RbConfig::CONFIG['target_os'] =~ /mswin|mingw/i
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'rspec-rails', '~> 3.7'
  gem 'factory_bot', '~> 4.8'
  gem 'faker', '~> 1.8'
  gem 'webmock', '~> 3.1'
  #gem 'factory_bot_rails', '~> 4.8'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
