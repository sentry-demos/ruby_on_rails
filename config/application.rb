require_relative 'boot'
require 'rails/all'
Bundler.require(*Rails.groups)

module TestRails
  class Application < Rails::Application
    config.load_defaults 5.1
  end
end

Sentry.init do |config|
  config.dsn = 'https://769540fdd5bd44a7ae33afdfb3016924@o87286.ingest.sentry.io/5520625'
end

