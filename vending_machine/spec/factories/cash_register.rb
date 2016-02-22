FactoryGirl.define do

  factory :cash_register, :class => "CashRegister" do
  	serial ENV["SERIAL"]
  end

end
