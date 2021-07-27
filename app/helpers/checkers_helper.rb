module CheckersHelper
  def jsonify(data)
    JSON.pretty_generate(data)
  end
end
