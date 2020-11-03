require 'rails_helper'

RSpec.describe 'sales/show', type: :view do
  before(:each) do
    @sale = assign(:sale, Sale.create!(
                            product: nil,
                            return_amount: '9.99',
                            buy_price: '9.99',
                            sell_price: '9.99'
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
  end
end
