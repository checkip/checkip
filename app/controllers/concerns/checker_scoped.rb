module CheckerScoped
  extend ActiveSupport::Concern

  included do
    before_action :set_checker
  end

  private

    def set_checker
      return unless Checker.new(ip: request.remote_ip).valid?

      @checker = Checker.new(ip: request.remote_ip)
    end
end
