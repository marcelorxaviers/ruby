module ParamsValidator
  RequestInvalid = Class.new(StandardError)

  def req(*keys)
    keys.each do |param|
      raise RequestInvalid.new("#{param} is requried") if params[param] == nil || 1 > params[param].length.to_i
    end
  end

  def fmt(param, regex)
    raise RequestInvalid.new("#{param} format is invalid") unless params[param].match(regex)
  end

end