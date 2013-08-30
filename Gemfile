source 'https://rubygems.org'

gem 'rails', '3.2.14'

gem 'dynamic_form', '1.1.4'

gem 'paperclip', '2.7.0'

gem "heroku"

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'


gem 'simple_form'
gem 'formtastic'
gem 'omniauth'
gem 'omniauth-google-oauth2'


# Gems used only for assets and not required
# in production environments by default.

  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'


gem 'jquery-rails'

gem 'anjlab-bootstrap-rails', '>= 3.0.0.0', :require => 'bootstrap-rails'


# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

group :production, :staging do
	gem 'pg'
end

group :test, :development do
	gem 'rspec-rails', '~> 2.11'
	gem "sqlite3-ruby", "~> 1.3.0", :require => "sqlite3"
end

group :test do
	gem 'capybara', '1.1.2'
	gem 'factory_girl', '2.6.4'
	gem 'launchy'
end
