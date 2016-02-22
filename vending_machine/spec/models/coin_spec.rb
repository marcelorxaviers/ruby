require 'rails_helper'

RSpec.describe Coin, type: :model do
  
  describe "validation" do

    let(:coin) { create(:coin) }

    it "does not accept value less than zero" do
      expect(coin.valid?).to be

      coin.value = -1.0
      expect(coin.valid?).to_not be 
    end

    it "does not accept coin without representation" do
      expect(coin.valid?).to be

      coin.representation = nil
      expect(coin.valid?).to_not be

      coin.representation = ''
      expect(coin.valid?).to_not be
    end

  end

  describe "scopes" do

    context "valuable" do

      let(:coin) { create(:coin) }
      let!(:zero) { create(:zero) }

      it "returns nothing if all of coins are zero" do
        expect(Coin.count).to eq 1
        expect(Coin.valuable.count).to eq 0
      end
      
      it "returns only the coins with value greater than zero" do
        coin
        expect(Coin.valuable.to_a).to include coin
      end


    end

  end

  describe "overrides" do

    let(:coin) { create(:coin) }
    
    describe "representation" do
      
      it "ensures that representation is always downcased" do
        uppercased = "anything".upcase
        coin.representation = uppercased

        expect(coin.representation).to eq(uppercased.downcase)
      end

    end

    describe "==" do

      let(:another_coin) { create(:coin) }

      context "when values and representations are same" do
        it { expect(coin == another_coin).to be }
      end

      context "when values are the same but representations are not" do

        before(:each) { another_coin.representation = "p #{coin.representation}"  }

        it { expect(coin == another_coin).to_not be }
      
      end


      context "when representations the are same but values are not" do

        before(:each) { another_coin.value = (coin.value + 1) }

        it { expect(coin == another_coin).to_not be }
      
      end

      context "when representations and values are not the same" do

        before(:each) do 
          another_coin.value = (coin.value + 1)
          another_coin.representation = "p #{coin.representation}"
        end

        it { expect(coin == another_coin).to_not be }
      
      end

      context "when the right side is not a coin" do
        it { expect(coin == 10).to_not be }
      end

    end

    describe ">" do

      let(:one_pound) { create(:one_pound) }
      let(:two_pounds) { create(:two_pounds) }
      
      context "when the right side is not a coin" do
        it { expect(coin > 10).to_not be }
      end

      context "when the coin has a greater value" do
        it { expect(two_pounds > one_pound).to_not be }
      end

      context "when the coin has a lower value" do
        it { expect(one_pound > two_pounds).to_not be }
      end

    end

    describe "to_f" do
      
      let(:coin) { create(:coin) }

      it { expect(coin.to_f).to eq(coin.value) }

    end

    describe "to_s" do

      let(:coin) { create(:coin) }

      it { expect(coin.to_s).to eq(coin.representation) }

    end

  end

end
