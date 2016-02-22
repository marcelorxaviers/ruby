FactoryGirl.define do

  factory :coin, class: 'Coin' do
    representation '1p'
    value 0.01

    factory :zero do
      representation 'zero'
      value 0.0
    end

    factory :one_pee do
      representation '1p' 
      value 0.01
    end

    factory :two_pee do
      representation '2p' 
      value 0.02
    end
    
    factory :five_pee do
      representation '5p' 
      value 0.05
    end
    
    factory :ten_pee do
      representation '10p'
       value 0.1
    end
    
    factory :twenty_pee do
      representation '20p'
      value 0.2
    end
    
    factory :fifty_pee do
      representation '50p'
      value 0.5
    end
    
    
    factory :one_pound do
      representation '£1' 
      value 1.0
    end
    
    factory :two_pounds do
      representation '£2' 
      value 2.0
    end

  end
end