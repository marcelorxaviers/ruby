require 'rails_helper'

RSpec.describe CoinFactory, type: :model do

  
  describe "#from_representation" do

    context "for invalid money representation" do
      let(:zero) { create(:zero) }
      
      it "is zero for any other strings than pennies and pounds" do
        random_string = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
        expect(CoinFactory.from_representation("1#{random_string}")).to eq(zero)
        expect(CoinFactory.from_representation("#{random_string}1")).to eq(zero)
      end

    end

    context "for valid money representation" do
      

      context "for a penny" do
        let(:one_pee) { create(:one_pee) }
        
        it { expect(CoinFactory.from_representation('1p')).to eq(one_pee) }
        it { expect(CoinFactory.from_representation('1P')).to eq(one_pee) }
        it { expect(CoinFactory.from_representation(' 1 P')).to eq(one_pee) }
      end

      context "for two pennies" do
        let(:two_pee) { create(:two_pee) }
        
        it { expect(CoinFactory.from_representation('2p')).to eq(two_pee) }
        it { expect(CoinFactory.from_representation('2P')).to eq(two_pee) }
        it { expect(CoinFactory.from_representation(' 2 P ')).to eq(two_pee) }
      end

      context "for five pennies" do
        let(:five_pee) { create(:five_pee) }
        
        it { expect(CoinFactory.from_representation('5p')).to eq(five_pee) }
        it { expect(CoinFactory.from_representation('5P')).to eq(five_pee) }
        it { expect(CoinFactory.from_representation(' 5 P')).to eq(five_pee) }
      end

      context "for ten pennies" do
        let(:ten_pee) { create(:ten_pee) }
        
        it { expect(CoinFactory.from_representation('10p')).to eq(ten_pee) }
        it { expect(CoinFactory.from_representation('10P')).to eq(ten_pee) }
        it { expect(CoinFactory.from_representation(' 10 P')).to eq(ten_pee) }
      end

      context "for twenty pennies" do
        let(:twenty_pee) { create(:twenty_pee) }
        
        it { expect(CoinFactory.from_representation('20p')).to eq(twenty_pee) }
        it { expect(CoinFactory.from_representation('20P')).to eq(twenty_pee) }
        it { expect(CoinFactory.from_representation(' 20 P')).to eq(twenty_pee) }
      end

      context "for fifty pennies" do
        let(:fifty_pee) { create(:fifty_pee) }
        
        it { expect(CoinFactory.from_representation('50p')).to eq(fifty_pee) }
        it { expect(CoinFactory.from_representation('50P')).to eq(fifty_pee) }
        it { expect(CoinFactory.from_representation(' 50 P')).to eq(fifty_pee) }
      end

      context "for a pound" do
        let(:one_pound) { create(:one_pound) }
        
        it { expect(CoinFactory.from_representation('£1')).to eq(one_pound) }
        it { expect(CoinFactory.from_representation(' £ 1 ')).to eq(one_pound) }
      end

      context "for a pound" do
        let(:two_pounds) { create(:two_pounds) }
        
        it { expect(CoinFactory.from_representation('£2')).to eq(two_pounds) }
        it { expect(CoinFactory.from_representation(' £ 2 ')).to eq(two_pounds) }
      end

    end
    
  end

  describe "#from_float" do

    context "for invalid british coin" do

      it "represents it as the value to string" do
        unknown_coin = CoinFactory.from_float(10)
        expect(unknown_coin.to_s).to eq(unknown_coin.value.to_s)
      end

    end

    context "for valid british coin" do

      context "for a penny" do
        let(:one_pee) { create(:one_pee) }
        
        it { expect(CoinFactory.from_float(0.01)).to eq(one_pee) }
      end

      context "for two pennies" do
        let(:two_pee) { create(:two_pee) }
        
        it { expect(CoinFactory.from_float(0.02)).to eq(two_pee) }
      end

      context "for five pennies" do
        let(:five_pee) { create(:five_pee) }
        
        it { expect(CoinFactory.from_float(0.05)).to eq(five_pee) }
      end

      context "for ten pennies" do
        let(:ten_pee) { create(:ten_pee) }
        
        it { expect(CoinFactory.from_float(0.1)).to eq(ten_pee) }
      end

      context "for twenty pennies" do
        let(:twenty_pee) { create(:twenty_pee) }
        
        it { expect(CoinFactory.from_float(0.2)).to eq(twenty_pee) }
      end

      context "for fifty pennies" do
        let(:fifty_pee) { create(:fifty_pee) }
        
        it { expect(CoinFactory.from_float(0.5)).to eq(fifty_pee) }
      end

      context "for a pound" do
        let(:one_pound) { create(:one_pound) }
        
        it { expect(CoinFactory.from_float(1)).to eq(one_pound) }
        it { expect(CoinFactory.from_float(1.0)).to eq(one_pound) }
      end

      context "for a pound" do
        let(:two_pounds) { create(:two_pounds) }
        
        it { expect(CoinFactory.from_float(2)).to eq(two_pounds) }
        it { expect(CoinFactory.from_float(2.0)).to eq(two_pounds) }
      end

    end
    
  end

end
