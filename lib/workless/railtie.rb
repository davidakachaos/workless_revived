require 'rails'
require 'delayed_job'

module Delayed
  class Railtie < Rails::Railtie
    initializer :after_initialize do |config|
      require 'workless/initialize'
      config.middleware.insert_after Rails::Rack::Logger, 'WorklessChecker'
    end
  end
end
