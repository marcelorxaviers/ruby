class MachineController < ApplicationController
  
  before_action :authenticate, only: [:receive_changes, :withdraw]

  def refill
    Machine.instance.refill_coins(money_params)
    @balance = Machine.instance.balance
  end

  def withdraw
    Machine.instance.withdraw
    @balance = Machine.instance.balance
  end

  private

    def money_params
      params.require(:money).require(:inserted)
    end

end
