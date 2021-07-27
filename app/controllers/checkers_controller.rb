class CheckersController < ApplicationController
  include CheckerScoped, CliDetection

  def new
    return unless @cli_detected

    respond_to do |format|
      format.html do
        render layout: false, plain: "#{@checker[:ip]}\n"
      end
    end
  end
end
