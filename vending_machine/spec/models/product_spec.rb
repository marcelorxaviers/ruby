require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe "validation" do

    it "does not accept two product with the same name" do
      p2 = Product.new(name: 'Anything', price: 1.0)
      expect(p2.valid?).to be 
      
      p1 = create(:product, name: 'Coke')
      p2.name = p1.name
      expect(p2.valid?).to_not be 
    end

    it "does not accept quantity less than zero" do
      p = Product.new(name: 'Anything', quantity: 1, price: 1.0)
      expect(p.valid?).to be

      p.quantity = -1
      expect(p.valid?).to_not be 
    end
  end

  describe "#available?" do
    let(:product) { create(:product) }

    it "is available when the quantity is greater than zero" do
      product.quantity = 1
      expect(product.available?).to be
    end

    it "is available when the quantity is zero" do
      product.quantity = 0
      expect(product.available?).to_not be
    end

  end

  describe "scopes" do

    context "available" do

      let(:product) { create(:product) }
      
      it "returns only the products with quantity greater than zero" do
        product.update(quantity: 1)
        expect(Product.available.to_a).to include product
      end

      it "returns nothing if none of the products has available quantity" do
        expect(Product.available.size).to eq 0
      end

    end

  end
end
