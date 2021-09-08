module CliDetection
  extend ActiveSupport::Concern

  included do
    before_action :cli_detected
  end

  private

    def cli_detected
      @cli_detected = ua_parse(request.user_agent)
    end

    def ua_parse(user_agent)
      user_agent =~ /\A(curl|Wget|HTTPie|httpie-go|Go-http-client)/
    end
end
