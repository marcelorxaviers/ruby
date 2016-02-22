class Supplier < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :site
  validates_presence_of :phone
end
