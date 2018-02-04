source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem 'activeadmin', '~> 1.1'
gem "coffee-rails", "~> 4.2"
gem "jbuilder", "~> 2.5"
gem "pg", "~> 0.18.4"
gem "puma", "~> 3.7"
gem "rails", "~> 5.1.4"
gem "sass-rails", "~> 5.0"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"
gem 'devise'
gem 'carrierwave', '~> 1.0'
gem 'figaro'
gem 'cloudinary'
gem 'simple_form'
gem "font-awesome-rails"
gem "cocoon"
gem 'jquery-rails'
gem 'geocoder'
gem "gmaps4rails"

source 'https://rails-assets.org' do
  gem "rails-assets-underscore"
end

group :development, :test do
  gem "spring"
  gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
  gem "better_errors"
  gem "binding_of_caller"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara", "~> 2.13"
  gem "database_cleaner"
  gem "guard-rspec", require: false
  gem "rspec-rails", "~> 3.7"
  gem "rubocop", "~> 0.52.1", require: false
  gem "selenium-webdriver"
  gem 'factory_bot_rails'
  gem 'launchy', '~> 2.4', '>= 2.4.3'
  gem 'shoulda-matchers', '~> 3.0', require: false
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
