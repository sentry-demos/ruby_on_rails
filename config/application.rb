require_relative 'boot'
require 'rails/all'
Bundler.require(*Rails.groups)


module TestRails
  class Application < Rails::Application
    config.load_defaults 5.1

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :options]
      end
    end
  end
end

Raven.configure do |config|
  config.dsn = 'https://c74d756a9db448228ee9aa26ffab404e@sentry.io/1445853'
  config.excluded_exceptions = []
  config.release = ENV['VERSION']
end
