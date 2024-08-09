source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 7.1.3.4'
ruby '3.3.4'

gem 'dotenv-rails', require: 'dotenv/load', groups: [:development, :test]

gem 'puma'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'slim'
gem 'slim-rails'
gem 'rails-i18n'
gem 'oj'
# gem 'therubyracer', platforms: :ruby

gem 'bootstrap-sass'
gem 'autoprefixer-rails'

gem 'jquery-rails'
gem 'turbolinks'
gem 'jquery-turbolinks'

gem 'jbuilder'


gem 'devise'
gem 'cancancan'
gem 'rolify'
gem 'omniauth'
gem 'omniauth-facebook'


gem 'image_processing'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'pry-rails'
  gem 'rspec-rails', '~> 6.1.3'
  gem 'simplecov', require: false
end

group :development do
  gem 'web-console'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'better_errors'
  gem 'rack-mini-profiler', require: false
  gem 'binding_of_caller'
  gem 'railroady'

end

group :test do
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'capybara'
  gem 'launchy'
  gem 'webmock'
  gem 'webdrivers', '~> 4.0', require: false
  gem 'database_cleaner'

end

gem 'pg'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

