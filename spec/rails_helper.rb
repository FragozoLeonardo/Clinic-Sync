require File.expand_path('../config/environment', __dir__)
require 'rspec/rails'
require 'factory_bot_rails'
require 'shoulda/matchers'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end


Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
