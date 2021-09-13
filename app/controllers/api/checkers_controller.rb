class Api::CheckersController < ApplicationController
  include CheckerScoped

  layout false

  def ip
    render plain: "#{@checker[:ip]}\n"
  end

  def hostname
    render plain: "#{@checker[:hostname]}\n"
  end

  def city
    render plain: "#{@checker[:city]}\n"
  end

  def region
    render plain: "#{@checker[:region]}\n"
  end

  def country
    render plain: "#{@checker[:country]}\n"
  end

  def loc
    render plain: "#{@checker[:loc]}\n"
  end

  def asn
    render json: "#{JSON.pretty_generate(@checker[:asn])}\n"
  end

  def json
    render json: "#{JSON.pretty_generate(@checker)}\n"
  end

  def ua
    render plain: "#{request.user_agent}\n"
  end
end
