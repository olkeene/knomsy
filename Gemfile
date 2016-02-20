source 'https://rubygems.org'
ruby "2.2.1"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'
gem 'thin'
gem 'rollbar'
gem 'pg', '~> 0.15'
gem 'haml-rails'
gem 'active_model_serializers'

gem 'email_validator'
gem 'validate_url'
gem 'date_validator' # AR dete validator
gem 'friendly_id'

# Use postgresql as the database for Active Record
gem 'draper' # decorator
gem 'acts-as-taggable-on' # tags

gem 'metainspector' # url meta fetch
# gem 'video_info'

# attachments
gem 'carrierwave'
gem 'cloudinary'

gem 'underscore-rails'
gem 'react-rails'
gem 'js-routes'
gem 'gon' # js vars

gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-linkedin'
gem 'omniauth-twitter'
# gem 'simple_token_authentication' # devise auth by token
# gem 'versionist' # api versions
# gem 'rack-cors', require: 'rack/cors' # Cross-Origin Resource Sharing

# gem 'redis'
# gem 'redis-namespace'
# gem 'redis-objects'

# gem 'resque', '~> 1.25.2'
# gem 'resque-retry'
# gem 'resque-web'
# gem 'resque-cleaner'

# gem 'therubyracer'
gem 'bootstrap-sass'
gem 'bootstrap_tokenfield_rails'
gem 'bootstrap-typeahead-rails'
gem 'bootstrap_form'
gem 'font-awesome-rails'
gem 'bootstrap-switch-rails'
# gem 'dropzonejs-rails'
source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap-fileinput' # file field
  gem 'rails-assets-object-to-formdata'  # file to form data
  gem 'rails-assets-object-traverse'     # requirement of formdata 
end
# gem 'activeadmin', github: 'activeadmin'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'jquery-rails'
gem 'jquery-ui-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.0'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'sextant' # routes
  gem 'quiet_assets'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'web-console', '~> 2.0'
  gem 'better_errors'
  gem 'binding_of_caller' # better_errors
end

group :development, :test do
  gem 'pry'
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
end

group :test do
  gem 'shoulda-matchers', github: 'thoughtbot/shoulda-matchers'
  gem 'factory_girl'
  gem 'factory_girl_rails'#, require: false
  gem 'faker'
  gem 'database_cleaner'
end

group :staging do
  gem 'rails_12factor'
end