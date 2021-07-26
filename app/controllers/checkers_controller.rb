class CheckersController < ApplicationController
  include CheckerScoped, CliDetection

  def new
    if @cli_detected
      respond_to do |format|
        format.html do
          render layout: false, plain: "#{@checker.ip}\n"
        end
      end
    end
    @ua = request.user_agent
  end
end
