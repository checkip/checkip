class CheckersController < ApplicationController
  include CheckerScoped

  def new
    @checker_json = JSON.pretty_generate(@checker.instance_values)
  end
end
