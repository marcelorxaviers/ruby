class Product < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true
  validates :price, :quantity, numericality: { greater_than_or_equal_to: 0 }

  scope :available, -> { where('quantity > 0') }

  def available?
    self.quantity > 0
  end
end
