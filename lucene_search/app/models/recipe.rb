class Recipe < ActiveRecord::Base

  def self.lucene_search(query)
    Recipe.select { |r| r if LuceneSearch.new(query).test(r.content) }
  end

end
