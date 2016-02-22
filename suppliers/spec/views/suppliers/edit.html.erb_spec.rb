require 'rails_helper'

RSpec.describe "suppliers/edit", type: :view do
  before(:each) do
    @supplier = assign(:supplier, Supplier.create!({ name: 'Marcelo', site: 'http://supplier.com', email: 'marcelo@supplier.com', phone: '554888439879' }))
  end

  it "renders the edit supplier form" do
    render

    assert_select "form[action=?][method=?]", supplier_path(@supplier), "post" do
    end
  end
end
