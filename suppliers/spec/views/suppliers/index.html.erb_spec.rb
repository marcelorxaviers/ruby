require 'rails_helper'

RSpec.describe "suppliers/index", type: :view do
  before(:each) do
    assign(:suppliers, [
      Supplier.create!({ name: 'Marcelo', site: 'http://supplier.com', email: 'marcelo@supplier.com', phone: '554888439879' }),
      Supplier.create!({ name: 'Anna', site: 'http://supplier.com', email: 'anna@supplier.com', phone: '554888439879' })
    ])
  end

  it "renders a list of suppliers" do
    render
  end
end
