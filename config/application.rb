require_relative 'boot'

require 'rails/all'
# require 'carrierwave'
# require 'carrierwave/orm/activerecord'
# config.autoload_paths += %W(#{config.root}/lib #{config.root}/app/uploaders)
# config.autoload_paths += "#{Rails.root}/app/uploaders"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module JobListing
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
