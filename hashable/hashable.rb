# frozen_string_literal: true

# This module, when included into an AR model, introduces to it the ability to turn queries into
# Hashes. the overal performance is then improved because of the usage of lightweight objects.
#
#
# Running the following benchmark:
# 5.times do
#   Benchmark.bm do |x|
#     x.report("Person Query As   JSON") { PersonQuery.as_json }
#     x.report("Person Query As Hashes") { PersonQuery.as_hashable }
#   end
# end
#
# I got the results down here:
#
#        user     system      total        real
# Person Query As   JSON  2.459487   0.042767   2.502254 (  2.545635)
# Person Query As Hashes  0.143044   0.003633   0.146677 (  0.221816)
#        user     system      total        real
# Person Query As   JSON  2.407691   0.071913   2.479604 (  2.535894)
# Person Query As Hashes  0.135674   0.010910   0.146584 (  0.211495)
#        user     system      total        real
# Person Query As   JSON  2.210443   0.047586   2.258029 (  2.328120)
# Person Query As Hashes  0.132944   0.008059   0.141003 (  0.186832)
#        user     system      total        real
# Person Query As   JSON  2.227801   0.051895   2.279696 (  2.324564)
# Person Query As Hashes  0.119017   0.011954   0.130971 (  0.190091)
#        user     system      total        real
# Person Query As   JSON  2.189322   0.039015   2.228337 (  2.288290)
# Person Query As Hashes  0.104705   0.012536   0.117241 (  0.171163)
#
#
# Considering the following:
#
# class Person
#   includes Hashable
# end
#
# Person
#   .where(id: 7)
#   .includes(:route)
#   .hash_from(columns: %w(name year routes.name), substitutions: { routes_name: :route })
#
# The result would be:
#
# [{ name: "Marcelo", year: 1984, route: "New one!" }]
module Hashable
  extend ActiveSupport::Concern

  class_methods do
    # It also accepts "*" to allow for querying for all fields in the main model
    def hash_from(columns: column_names, substitutions: {})
      all_columns = columns.include?("*") ? (column_names + columns - ["*"]).uniq : columns
      outer_columns = associations_to_include(columns)

      # If we do have any columns from an association, we then need to include the relation in the
      # query
      query = outer_columns.any? ? includes(*outer_columns) : self

      substitutions = substitutions.with_indifferent_access
      keys = all_columns.map { |col| substitutions.key?(col) ? substitutions[col] : col }
      query.pluck(*all_columns).map do |values|
        keys.zip(Array.wrap(values)).to_h.with_indifferent_access
      end
    end

    def model_attributes(query_result)
      query_result.select { |k, _v| column_names.include?(k.to_s) }
    end

    def associations_attributes(query_result, outer_columns)
      outer_columns.reduce({}) do |hash, pair|
        hash.tap do
          attrs = query_result.select { |k, _v| pair.last.include?(k.to_s) }
          hash[pair.first] = Hash.new(*attrs.keys.map(&:to_sym)).new(**attrs) if attrs.present?
        end
      end.to_h
    end

    def associations_to_include(columns)
      # Subtracting the queried columns from the table columns should give us the associations'
      # columns names
      outer_columns_names = columns.map(&:to_s) - column_names.map(&:to_s)
      return {} if outer_columns_names.empty?

      # When the column name contains a dot, it means that it already contains the information about
      # the association table name
      including = outer_columns_names.filter_map do |col|
        table, column = col.split(".")
        table.singularize if column.present?
      end

      outer_columns_names -= including
      one_to_one_associations.reduce(Set.new(including)) do |result, association|
        outer = association.klass.column_names.select do |column|
          outer_columns_names.include?(column)
        end
        result.tap { result << outer if outer.present? }
      end
    end

    # Retrieves the model one-to-one and belongs_to associations. It skips polymorphic associations,
    # as there is no way to know beforehand which fields one could query
    def one_to_one_associations
      @one_to_one_associations ||= reflect_on_all_associations.select do |association|
        # We cannot predict what fields a polymorphic association might have,
        # so we need to exclude them
        next if association.polymorphic?

        association if association.macro == :belongs_to || association.macro == :has_one
      end
    end
  end
end
