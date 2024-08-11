source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 7.1.3.4'
ruby '3.3.4'

gem 'dotenv', groups: [:development, :test]

gem 'puma'
gem 'terser'
gem 'slim'
gem 'slim-rails'
gem 'rails-i18n'
gem 'propshaft'
gem "dartsass-rails", "~> 0.5.1"
gem "rails_icons", "~> 0.3.0"

gem "importmap-rails", "~> 2.0.1"
gem 'bootstrap', '~> 5.3.3'
gem "popper_js", "~> 2.11"
gem 'autoprefixer-rails'
gem 'turbo-rails'

gem 'jbuilder'

gem 'devise'
gem 'cancancan'
gem 'rolify'

group :development, :test do
  gem 'pry-rails'
  gem 'rspec-rails', '~> 6.1.3'
  gem 'simplecov', require: false
end

group :development do
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'rack-mini-profiler', require: false
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

