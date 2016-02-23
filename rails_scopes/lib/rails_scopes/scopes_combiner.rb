module RailsScopes
  module ScopesCombiner
    def combined_methods_names(hash)
      2.upto(hash.size).map do |n|
        hash.keys.combination(n).map { |combined| combined.join('_or_') }
      end.flatten
    end

    def combine_scopes_for_attribute(attribute_name, hash)
      2.upto(hash.size).each do |n|
        hash.keys.combination(n).each do |combined|
          define_singleton_method(combined.join('_or_')) do
            where(attribute_name => combined.map { |k| hash[k] })
          end
        end
      end
    end
  end
end
