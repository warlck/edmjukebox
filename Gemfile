source 'https://rubygems.org'
ruby "1.9.3"

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg' 
gem 'newrelic_rpm'
gem 'feedzirra'
gem 'magic_encoding'
gem "validates_timeliness", "~> 3.0.14"
gem "bootstrap-sass"
gem "paperclip", '~> 3.5.0'
gem 'aws-sdk', '~> 1.6.0'
gem 'turbolinks'
gem 'jquery-turbolinks'
gem 'daemons-rails'
gem 'dalli'
gem 'memcachier'


group :production do
	gem 'SyslogLogger'
end

group :development, :test do
	gem 'rspec-rails', '2.11.0'
	gem 'guard-rspec'
	gem 'guard-spork'
	gem 'childprocess'
	gem 'spork'
	gem 'debugger'
end

group :test do
	gem 'capybara', '1.1.2'
	gem 'rb-inotify'
	gem 'libnotify'
	gem 'factory_girl_rails'
	gem 'cucumber-rails', :require => false
	gem 'database_cleaner'
	gem 'launchy'
	gem 'simplecov'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'compass-rails'
  gem 'compass-susy-plugin'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
 gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
