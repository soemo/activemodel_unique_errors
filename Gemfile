source 'http://rubygems.org'


activemodel_version = ENV['ACTIVEMODEL_VERSION'] || 'default'

current_version = case activemodel_version
                    when 'master'
                      {:github => 'rails/rails/tree/master/activemodel'}
                    when 'default'
                      '~> 4.1.4'
                    else
                      "~> #{activemodel_version}"
                  end

gem 'activemodel', current_version




# Add dependencies to develop your gem here.
# Include everything needed to run rake, tests, features, etc.
group :development do
  gem 'yard',    '~> 0.7'
  gem 'bundler', '~> 1.0'
  gem 'jeweler', '~> 2.0.1'
end

group :test do
  gem 'rspec', '~> 2.8.0'
end
