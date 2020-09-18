source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'devise'
gem 'devise-i18n'
gem 'rails-i18n', '~> 6.0.0'

gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
gem 'puma', '~> 4.1'
gem 'webpacker', '~> 4.0'

gem 'carrierwave'
gem 'rmagick'
gem 'fog-aws'


group :development, :test do
  gem 'sqlite3', '~> 1.4'
  gem 'pry-rails'
end

group :production do
  gem 'pg'
end
