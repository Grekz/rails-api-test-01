require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# Example only, please understand CORS before blindly adding this configuration
# This is not enabled in the peeps source code.
module Peeps
  class Application < Rails::Application
    config.autoload_paths += %W(#{config.root}/app/workers)
    config.middleware.insert_before 0, Rack::Cors, :debug => !Rails.env.production?, :logger => (-> { Rails.logger }) do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :patch, :delete, :options]
      end
    end
  end
end