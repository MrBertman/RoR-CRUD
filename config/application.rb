require_relative 'boot'

require 'rails/all'


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SimpleCrud
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.active_job.queue_adapter = :sidekiq
    config.cache_store = :redis_store, "redis://localhost:6379/0/cache", { expires_in: 30.minutes }
    # Logger config
    config.logstasher.enabled = true
    config.logstasher.controller_enabled = true
    config.logstasher.mailer_enabled = true
    config.logstasher.record_enabled = true
    config.logstasher.view_enabled = true
    config.logstasher.job_enabled = true
    #config.logger = LogStashLogger.new(port: 5228)
    # Optional, defaults to :udp.
    # config.logstash.type = :udp
    # Required, the port to connect to
    # config.logstash.port = 5228
    # Formatter
    # config.logstash.formatter = :json_lines

    # Required
    #config.logstash.type = :syslog

    # Optional. Defaults to 'ruby'
    # config.logstash.program_name = 'RoR_crud'
    # config.lograge.keep_original_rails_log = true
    # config.logger = LogStashLogger.new(type: :tcp,
    #                                    host: 'localhost',
    #                                    port: 5229)
    # config.lograge.enabled = true
    # config.lograge.formatter = Lograge::Formatters::Logstash.new
    # config.lograge.base_controller_class = 'ApplicationController'
    # config.lograge.logger = LogStashLogger.new(port: 5228)
    # config.lograge.custom_options = lambda do |event|
    #   exceptions = %w(controller action format id)
    #   {
    #       params: event.payload[:params].except(*exceptions),
    #       time: event.time
    #   }
    # end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.generators do |g|
      g.test_framework  :rspec, fixtures: true, view: false
      g.fixture_replacement :factory_bot, dir: "spec/factories"
    end
  end
end
