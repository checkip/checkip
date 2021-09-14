class CheckersController < ApplicationController
  include CheckerScoped, CliDetection

  def new
    respond_to do |format|
      format.html do
        return unless @cli_detected

        render layout: false, plain: "#{@checker[:ip]}\n"
      end
      format.json do
        render json: "#{JSON.pretty_generate(@checker)}\n"
      end
    end
  end
end
