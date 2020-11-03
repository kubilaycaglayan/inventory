require 'rails_helper'

RSpec.describe 'sales/index', type: :view do
  before(:each) do
    assign(:sales, [
             Sale.create!(
               product: nil,
               return_amount: '9.99',
               buy_price: '9.99',
               sell_price: '9.99'
             ),
             Sale.create!(
               product: nil,
               return_amount: '9.99',
               buy_price: '9.99',
               sell_price: '9.99'
             )
           ])
  end

  it 'renders a list of sales' do
    render
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
  end
end
