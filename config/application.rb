require_relative 'boot'
require 'rails/all'
Bundler.require(*Rails.groups)

module TestRails
  class Application < Rails::Application
    config.load_defaults 5.1
  end
end

Sentry.init do |config|
  config.dsn = 'https://c74d756a9db448228ee9aa26ffab404e@sentry.io/1445853'
end

