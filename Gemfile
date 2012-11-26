source 'https://rubygems.org'

ruby '1.9.3'
gem 'rails', '3.2.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development do
  gem 'pry'
  gem 'pry-nav'
  gem 'pry-stack_explorer'
end

gem 'pg'

group :development, :test do
  gem 'minitest-rails'
  gem 'minitest-rails-capybara'
end

group :development do
  gem 'rb-inotify', require: false 
  gem 'rb-fsevent', require: false
  gem 'growl', require: false if RUBY_PLATFORM.downcase.include?("darwin")
  gem 'guard-minitest'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platform => :ruby

  gem 'uglifier', '>= 1.0.3'

  gem 'bootstrap-sass'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

gem 'simple_form'
gem 'net-ldap'
gem 'friendly_id'
gem 'paperclip'
gem 'globalize3'
gem 'mysql2', require: false
