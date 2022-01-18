Rails.application.configure do
  config.lograge.enabled = true

  config.lograge.formatter = Lograge::Formatters::Json.new

  config.lograge.ignore_actions = ['MonitorsController#show']
end
