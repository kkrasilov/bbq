source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'devise'
gem 'pundit', '~> 2.1.0'
gem 'devise-i18n'
gem 'rails-i18n', '~> 6.0.0'

gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
gem 'puma', '~> 4.1'
gem 'webpacker', '~> 4.0'
gem 'resque', '~> 2.0'

gem 'carrierwave'
gem 'rmagick'
gem 'fog-aws'
gem "letter_opener", :group => :development

group :development, :test do
  gem 'sqlite3', '~> 1.4'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 4.0.1'
  gem 'factory_bot_rails'

  gem 'capistrano', '~> 3.14.1'
  gem 'capistrano-rails', '~> 1.6.1'
  gem 'capistrano-passenger', '~> 0.2'
  gem 'capistrano-rvm', '~> 0.1.2'
  gem 'capistrano-bundler', '~> 2.0.1'
end

group :production do
  gem 'pg'
end
