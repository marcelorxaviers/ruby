require 'rails_helper'

RSpec.describe "suppliers/show", type: :view do
  before(:each) do
    @supplier = assign(:supplier, Supplier.create!({ name: 'Marcelo', site: 'http://supplier.com', email: 'marcelo@supplier.com', phone: '554888439879' }))
  end

  it "renders attributes in <p>" do
    render
  end
end
