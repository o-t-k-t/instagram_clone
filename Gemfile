source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Core
ruby '2.3.1'
gem 'rails', '~> 5.1.1'

# Middleware
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'

# Image Upload
gem 'carrierwave'
gem 'fog'
gem 'mini_magick'
gem 'unicorn'

# Frontend
gem 'bulma-rails', '~> 0.4.2'
gem 'coffee-rails', '~> 4.2'
gem 'haml-rails'
gem 'jbuilder', '~> 2.5'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

# Auth
gem 'bcrypt', '~> 3.1.11'
gem 'dotenv-rails' ##追記

# Test data
gem 'faker'

# Deploy
gem 'therubyracer', platforms: :ruby

group :development, :test do
  # Debug
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.13'

  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-rails'

  # Static analyze
  gem 'haml_lint'
  gem 'rubocop'

  # Test
  gem 'selenium-webdriver'
end

# Development environment
group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'

  # Mail
  gem 'letter_opener_web'

  # Deploy
  gem 'capistrano', '3.6.0'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano3-unicorn'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
