require 'singleton'

class Machine
  include Singleton

  def cash_register
    CashRegister.find_by serial: ENV["SERIAL"]
  end

  def process!(product, coins_stack_as_string)
    raise "Product not availabe" unless product.available?
    coins = convert_to_coins(coins_stack_as_string)
    change = cash_register.change_for!(product.price, coins)
    product.update(quantity: product.quantity.pred)
    change
  end

  def convert_to_coins(coins_stack_as_string)
    representations = coins_stack_as_string.split(',')
    representations.map { |m| CoinFactory.from_representation(m) }
  end

  def refill_coins(coins_stack_as_string)
    cash_register.refill_coins(convert_to_coins(coins_stack_as_string))
  end

  def changes
    cash_register.changes
  end

  def balance
    cash_register.balance
  end

  def withdraw
    cash_register.withdraw
  end

end