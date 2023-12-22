# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.1'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'devise', '~> 4.9', '>= 4.9.3'
gem 'devise-jwt', '~> 0.11.0'
gem 'jsonapi-serializer', '~> 2.2'
gem 'rails', '~> 7.0.8'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

group :development, :test do
  gem 'annotate', '~> 3.2'
  gem 'lefthook', '~> 1.0', '>= 1.0.1', require: false
  gem 'rspec-rails', '~> 5.1', '>= 5.1.2'

  # rubocop
  gem 'rubocop', '~> 1.30', '>= 1.30.1', require: false
  gem 'rubocop-performance', '~> 1.14', '>= 1.14.2', require: false
  gem 'rubocop-rails', '~> 2.15', require: false
  gem 'rubocop-rspec', '~> 2.11', '>= 2.11.1', require: false

  # data generator
  gem 'factory_bot_rails', '~> 6.2'
  gem 'ffaker', '~> 2.21'

  # debug
  gem 'pry', '~> 0.14.1'
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
  # lintering
  gem 'brakeman', '~> 5.2', '>= 5.2.3', require: false
  gem 'fasterer', '~> 0.10.0', require: false
end

group :test do
  # matchers
  gem 'json_matchers', '~> 0.11.1', require: 'json_matchers/rspec'
  gem 'shoulda-matchers', '~> 5.1'
end
