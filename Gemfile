# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'activesupport', '~> 7.0', '>= 7.0.4.3'
gem 'bootsnap', '~> 1.16', require: false
gem 'bootstrap', '~> 5.2.3'
gem 'devise', '~> 4.8'
# rubocop:disable Bundler/OrderedGems
# https://github.com/hisea/devise-bootstrap-views/issues/55
gem 'devise-i18n', '~> 1.10.2'
gem 'devise-bootstrap-views', '~> 1.0'
# rubocop:enable Bundler/OrderedGems
gem 'dotenv-rails', '~> 2.7.6'
gem 'ffaker', '~> 2.21.0'
gem 'hamlit', '~> 3.0.3'
gem 'hamlit-rails', '~> 0.2.3'
gem 'html2haml', '~> 2.2.0'
gem 'importmap-rails', '~> 1.1.5'
gem 'interactor', '~> 3.1.2'
gem 'jbuilder', '~> 2.11.5'
gem 'jquery-rails', '~> 4.5.1'
gem 'overcommit', '~> 0.60.0'
gem 'pagy', '~> 6.0'
gem 'pg', '~> 1.4.5'
gem 'puma', '~> 5.0'
gem 'rack', '~> 2.2.6.4'
gem 'rails', '~> 7.0.4', '>= 7.0.4.2'
gem 'rails-i18n', '~> 7.0.0'
gem 'sassc-rails', '~> 2.1.2'
gem 'sprockets-rails', '~> 3.4.2'
gem 'stimulus-rails', '~> 1.2.1'
gem 'turbo-rails', '~> 1.3.3'
gem 'tzinfo-data', '~> 2.0.6', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'bundler-audit', '~> 0.9.1'
  gem 'bundler-leak', '~> 0.3.0'
  gem 'debug', '~> 1.7.1', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 6.2.0'
  gem 'fasterer', '~> 0.10.0'
  gem 'pry-byebug', '~> 3.10.1'
  gem 'pry-rails', '~> 0.3.9'
  gem 'rails_best_practices', '~> 1.23.2'
  gem 'rspec', '~> 3.12.0'
  gem 'rspec-rails', '~> 6.0.1'
  gem 'rubocop', '~> 1.44.1'
  gem 'rubocop-md', '~> 1.2.0'
  gem 'rubocop-performance', '~> 1.16'
  gem 'rubocop-rails', '~> 2.18'
  gem 'rubocop-rake', '~> 0.6'
  gem 'rubocop-rspec', '~>2.18'
end

group :development do
  gem 'guard-rspec', '~> 4.7.3', require: false
  gem 'web-console', '~> 4.2.0'
end

group :test do
  gem 'shoulda-matchers', '~> 5.1.0'
  gem 'simplecov', '~> 0.22.0'
  gem 'simplecov-html', '~> 0.12.3'
  gem 'simplecov-json', '~> 0.2.3'
  gem 'simplecov-lcov', '~> 0.8.0'
  gem 'simplecov-shields-badge', '~> 0.1.0'
end
