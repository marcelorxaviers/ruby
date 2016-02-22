['Coke', 'Fanta', 'Cheetos', 'Water', 'Fandangos'].each do |name|
  Product.create(name: name, price: 1.0, quantity: 5)
end

{'1p' => 100, '2p' => 50, '5p' => 20, '10p' => 10, '20p' => 5, '50p' => 2, '£1' => 4, '£2' => 2}.each do |r, t|
   t.times { |b| CoinFactory.from_representation(r) }
end

cr = CashRegister.create(serial: ENV["SERIAL"])
cr.coins << Coin.all