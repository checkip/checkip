Rails.application.configure do
  config.lograge.enabled = true
  config.lograge.keep_original_rails_log = true

  config.lograge.logger = ActiveSupport::Logger.new "#{Rails.root}/log/lograge_#{Rails.env}.log"

  config.lograge.formatter = Lograge::Formatters::Json.new

  config.lograge.ignore_actions = ['MonitorsController#show']

  config.lograge.custom_options = lambda do |event|
    { time: Time.now }
  end

  config.lograge.custom_payload do |controller|
    { request_id: controller.request.request_id }
  end
end
