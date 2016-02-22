require 'rails_helper'

RSpec.describe CashRegister, type: :model do

  describe "#change_for!" do

    let(:cash_register) { create(:cash_register) }
    let(:two_pounds) { create(:two_pounds) }
    
    context "with less money than necessary" do
      
      it "raises an error" do
        expect { cash_register.change_for!(3.0, [two_pounds]) }.to raise_error(/Insufficient coins given/)
      end

    end

    context "with the right amount of money" do

      it "returns no change" do
        expect(cash_register.change_for!(two_pounds.to_f, [two_pounds])).to eq(0)
      end

    end

    context "with more than necessary" do
      
      let(:one_pound) { create(:one_pound) }
      before(:each) { cash_register.coins << [ one_pound ] }

      context "and has changes" do
        
        it "returns the right change" do
          expect(cash_register.change_for!(1.0, [two_pounds])).to eq(one_pound.to_s)
        end
      
      end

      context "and has no changes" do
  
        before(:each) do 
          cash_register.coins = [ two_pounds ]
          cash_register.save
        end

        it "raises an error" do
          expect { cash_register.change_for!(1.0, [two_pounds]) }.to raise_error(/No changes for this set of coins/)
        end

      end

    end

  end

  describe "#balance" do

    let(:cash_register) { create(:cash_register) }
    let(:fifty_pee) { create(:fifty_pee) }
    let(:one_pound) { create(:one_pound) }
    let(:two_pounds) { create(:two_pounds) }
    
    context "with no coins" do
      it { expect(cash_register.balance).to eq(0) }
    end

    context "with one coin" do

      before(:each) { cash_register.coins << [ one_pound ] }
      
      it { expect(cash_register.balance).to eq(one_pound.value) }

    end

    context "with many coins" do

      before(:each) { cash_register.coins << [ fifty_pee, one_pound, two_pounds ] }
      
      it { expect(cash_register.balance).to eq((fifty_pee.to_f + one_pound.to_f + two_pounds.to_f)) }

    end

  end

  describe "#withdraw" do
    let(:cash_register) { create(:cash_register) }
    let(:fifty_pee) { create(:fifty_pee) }
    let(:one_pound) { create(:one_pound) }
    let(:two_pounds) { create(:two_pounds) }

    
    context "with any number of coins coins" do

      let(:twenty_pee) { create(:twenty_pee) }
      
      before(:each) do
        cash_register.coins << [ fifty_pee, one_pound, two_pounds ]
        twenty_pee # Coin out of the cash register
      end
      
      it "returns zero and destroys all coins of the cash register" do 
        expect(cash_register.withdraw).to eq((fifty_pee.to_f + one_pound.to_f + two_pounds.to_f))
        expect(cash_register.coins.count).to eq(0)
        expect(Coin.count).to_not eq(0)
      end

    end

  end


  describe "#refill_coins" do

    let(:cash_register) { create(:cash_register) }
    
    it "increases the amount of coins" do
      previous = cash_register.coins.count
      cash_register.refill_coins( [ create(:fifty_pee) ] )
      expect(cash_register.coins.count > previous).to be
    end

  end

  describe "#changes" do

    let(:cash_register) { create(:cash_register) }
    let(:fifty_pee) { create(:fifty_pee) }
    let(:one_pound) { create(:one_pound) }
    let(:two_pounds) { create(:two_pounds) }
    let(:coins) { [ fifty_pee, one_pound, two_pounds ] }

    before(:each) { cash_register.coins << coins }
    
    it "returns the changes as string" do
      expected = coins.map { |c| [c.value, 1] }.to_h
      expect(cash_register.changes).to eq(expected)
    end

  end

end
