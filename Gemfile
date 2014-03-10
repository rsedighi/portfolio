source 'https://rubygems.org'
ruby '2.1.0'

gem "minitest-rails"

group :test do
  gem "minitest-rails-capybara"
  gem 'simplecov', :require => false, :group => :test
end


gem 'rails', '4.0.2'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'bootstrap-sass', github: "thomas-mcdonald/bootstrap-sass"
gem 'devise'
gem 'better_errors'
gem "pundit"
gem 'binding_of_caller'
gem 'omniauth-twitter'
gem 'figaro'
gem 'paperclip'
gem 'aws-sdk'
gem 'postmark-rails', '~> 0.5.2'
gem 'cancancan', '~> 1.7'

group :development, :test do
  gem 'sqlite3'
  gem 'letter_opener'
  gem 'turn', require: false
  gem 'launchy'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end
