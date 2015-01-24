source 'http://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.1'
# Use mysql as the database for Active Record
gem 'pg'
gem 'dotenv-rails'


group :admin, :default do
  gem 'rails_admin', :git => 'git://github.com/sferik/rails_admin.git'
  gem "rails_admin_import"

end

# Use SCSS for stylesheets
gem 'haml-rails'
gem 'sass-rails', '~> 4.0.3'
gem 'autoprefixer-rails'
gem 'font-awesome-sass', '~> 4.2.0'


# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
#gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

group :ui_goodies, :default do
  gem 'growlyflash', '~> 0.5.0'
end

# authentication
group :auth, :default do
	gem 'acts_as_tenant'
  gem 'cancan'
  gem 'devise'
  gem 'devise-async'
end



group :development, :default do
 gem 'better_errors'
 gem 'binding_of_caller'
 gem 'puma'
end

#geo
group :geo, :default do
  gem 'geokit-rails'
end

group :files, :default do
  gem 'jquery-fileupload-rails'
  gem 'paperclip', "3.4.2"
  gem 'remotipart', '~> 1.2'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
