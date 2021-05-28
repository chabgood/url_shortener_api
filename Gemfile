source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'
gem 'mysql2'
gem 'rails', '~> 6.0.3', '>= 6.0.3.6'
gem 'puma', '~> 4.1'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'dotenv'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'pry'
  gem 'pry-rails'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'database_cleaner'
end

group :development do
  gem 'guard-rspec', require: false
  gem 'listen', '~> 3.2'
  gem 'rubocop-rails', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
