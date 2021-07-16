source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails', '~> 6.1.1'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'simple_form', '~> 5.1'
gem 'awesome_print', '~> 1.9', '>= 1.9.2'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.7'
gem 'devise', '~> 4.7', '>= 4.7.3'
gem "pundit"
gem 'nokogiri', '~> 1.10.3'
gem 'notifications'
gem 'acts_as_votable'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'guard'
  gem 'guard-livereload', '~> 2.5', require: false
  gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem 'sqlite3', '~> 1.4'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  #gem 'capybara', '>= 3.26'
  #gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  #gem 'webdrivers'
end

group :production do
  gem 'pg'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
