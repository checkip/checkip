Rails.application.configure do
  config.lograge.enabled = true
  config.lograge.keep_original_rails_log = true

  config.lograge.logger = ActiveSupport::Logger.new(
    Rails.root.join("log/lograge_#{Rails.env}.log").to_s
  )

  config.lograge.formatter = Lograge::Formatters::Json.new

  config.lograge.ignore_actions = ['MonitorsController#show']

  config.lograge.custom_options = lambda do |event|
    {
      time: Time.zone.now,
      ip: event.payload[:request].remote_ip,
      request_id: event.payload[:request].request_id
    }
  end
end
