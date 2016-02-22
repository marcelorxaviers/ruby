class CashRegister < ActiveRecord::Base

  has_many :coins, -> { order "value DESC" }, foreign_key: "coin_id", :class_name => "Coin"

  validates :serial, uniqueness: true, presence: true

  def change_for!(price, given_coins)
    debt = balance(given_coins) - price
    debt > 0 ? change!(given_coins, debt) : receive!(given_coins, debt)
  end

  def balance(stack = coins)
    stack.map(&:to_f).sum.round(2)
  end

  def withdraw
    b = balance
    coins.destroy_all
    b
  end

  def refill_coins(new_coins)
    coins << new_coins
  end

  def changes
    coins.valuable.group(:value).count
  end

  private

    def receive!(given_coins, debt)
      raise "Insufficient coins given: Lacking #{debt.abs}" unless debt == 0
      self.coins << given_coins
      0
    end

    def change!(given_coins, debt)
       all_coins = coins.to_a + given_coins
      raise "Not enough change" if balance(all_coins) < debt
      collect_change!(all_coins, debt)
    end

    def collect_change!(coins_stack, debt)
      hash = collect_change_for(coins_stack, debt.round(2))
      raise "No changes for this set of coins" if hash[:debt] > 0
      coins << coins_stack
      hash[:coins_used].each(&:destroy)
      hash[:coins_used].map(&:to_s).join("\t")
    end

    def collect_change_for(coins, debt)
      coins_used = []
      coins.each do |coin|
        next if coin.to_f > debt
        coins_used << coin
        debt = (debt - coin.to_f).round(2)
        break if debt == 0
      end
      { debt: debt, coins_used: coins_used }
    end

end
