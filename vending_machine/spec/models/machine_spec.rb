require 'rails_helper'

RSpec.describe Machine, type: :model do

  describe "#process!" do
  
    before(:each) { create(:cash_register) }

    context "when paymment is alright" do

      let(:coin) { '£1' }
      let(:price) { 1.0 }
      let(:product) { create(:product, price: price, quantity: 1) }
      
      context "and product is available" do
        
        it 'accept payment and give product back' do
          expected = Machine.instance.process!(product, coin)
          expect(expected).to eq 0
          expect(product.quantity).to eq 0
        end

      end

      context "but product is not available" do
        
        before(:each) { product.quantity = 0 }

        it 'raises error' do
          expect { Machine.instance.process!(product, coin) }.to raise_error
        end
      
      end
    
    end
    
  end

end
