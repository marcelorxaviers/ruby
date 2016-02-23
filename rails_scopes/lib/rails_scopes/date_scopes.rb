module RailsScopes
  module DateScopes

    def date_scopes_names(attribute_names)
      attribute_names.each.map do |name|
        [ "#{name}_between",
          "#{name}_less_equal_than",
          "#{name}_greater_equal_than" ]
      end.flatten
    end

    def create_date_scopes_for(attribute_names)
      attribute_names.each do |attr_name|
        between(attr_name)
        less_equal(attr_name)
        greater_equal(attr_name)
      end
    end

    private

    def between(attr_name)
      scope_name = "#{attr_name}_between"
      define_singleton_method(scope_name) do |start_date, end_date|
        s = format_date(start_date).beginning_of_day
        e = format_date(end_date).end_of_day
        where(attr_name => (s..e))
      end
    end

    def less_equal(attr_name)
      scope_name = "#{attr_name}_less_equal_than"
      define_singleton_method(scope_name) do |date|
        where("#{attr_name.to_s} <= ?", format_date(date).end_of_day)
      end
    end
    
    def greater_equal(attr_name)
      scope_name = "#{attr_name}_greater_equal_than"
      define_singleton_method(scope_name) do |date|
        where("#{attr_name.to_s} >= ?", format_date(date).beginning_of_day)
      end
    end

  end
end
