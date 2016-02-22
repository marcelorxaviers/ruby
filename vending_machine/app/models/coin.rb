class Coin < ActiveRecord::Base
  
  validates :representation, presence: true
  validates :value, numericality: { greater_than_or_equal_to: 0 }

  scope :valuable, -> { where('value > 0') }

  def representation=(representation)
    self[:representation] = representation.try(:downcase)
  end

  def ==(coin)
    return false unless coin.is_a? Coin
    self.representation == coin.representation && self.value == coin.value
  end

  def >(coin)
    return false unless coin.is_a? Coin
    self.representation == coin.representation && self.value == coin.value
  end

  def to_f
    value
  end

  def to_s
    self.representation
  end

end
