source 'https://rubygems.org'

ruby '1.9.3'
gem 'rails', '3.2.11'

gem 'pg', group: :production

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

group :development, :test do
  gem 'sqlite3'
  gem 'minitest-spec-rails'
  gem 'factory_girl_rails'
end

group :development do
  gem 'pry'
  gem 'pry-nav'
  gem 'pry-stack_explorer'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'better_errors'
  gem 'binding_of_caller'
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

group :production do
  gem 'thin'
end
