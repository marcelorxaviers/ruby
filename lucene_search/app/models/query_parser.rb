module QueryParser 
  extend self

  def parse(query)
    substitutions = {}
    terms = query.split(/AND|OR/).each { |t| substitutions[t] = Term.new(t) }
    parsed = query
    substitutions.each { |k, v| parsed.sub!(k, v.in?('')) }

    lambda do |fn, terms, string|
      p "Searching '#{terms.join(fn.to_s)}' into '#{string}'"
      eval(terms.map { |t| t.in?(string).to_s }.join(fn.to_s))
    end
  end

end
