source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "simple_calendar", "~> 2.0"
gem 'geocoder'
gem 'rails', '~> 6.0.2'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'carrierwave', '~> 2.0'
gem 'file_validators'
gem 'jbuilder', '~> 2.7'
gem 'mini_magick'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.5'
gem 'font_awesome5_rails'
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'
gem 'rspec-core', '~> 3.4'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # For testing
  # https://github.com/rspec/rspec-rails/issues/2177
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'rails-controller-testing'
  gem 'rspec-rails', '4.0.0.beta3'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'annotate', '~> 3.0', '>= 3.0.3'
  gem 'letter_opener', '~> 1.4', '>= 1.4.1'
  gem 'rubocop', '~> 0.77.0'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # to count DB queries
  gem 'bullet'
  # To deploy
  gem 'capistrano', '~> 3.8', '>= 3.8.1'
  gem 'capistrano-bundler'
  gem 'capistrano-nginx', '~> 1.0'
  gem 'capistrano-rails', '~> 1.2', '>= 1.2.3'
  gem 'capistrano-rbenv'
  gem 'capistrano-rvm', '~> 0.1.2'
  # gem 'capistrano-sidekiq'
  gem 'capistrano-upload-config', '~> 0.7.0'
  gem 'capistrano3-puma'
  gem 'sshkit-sudo', '~> 0.1.0'
end

group :test do
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
  # To clean test DB after every test
  gem 'database_cleaner-active_record'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'sorcery'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'carrierwave', '~> 2.0'
