class Comment < ActiveRecord::Base
	belongs_to :supplier
	validates_presence_of :supplier_id
	validates_presence_of :body
end
