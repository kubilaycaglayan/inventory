require 'rails_helper'

RSpec.describe Sale, type: :model do
  let(:return_amount) { 1950.50 }
  let(:buy_price) { 5500.00 }
  let(:sell_price) { 6200.50 }
  let(:p1) { Product.create(code: 'WAT24480TR', definition: 'Washing Machine') }
  let(:sale1) { Sale.new(date: '2020-10-27', product_id: p1.id, return_amount: return_amount, buy_price: buy_price, sell_price: sell_price) }
  let(:sale2) { Sale.new(return_amount: return_amount, buy_price: buy_price, sell_price: sell_price) }
  let(:sale3) { Sale.new(date: '2020-10-27', product_id: p1.id, return_amount: return_amount, buy_price: buy_price, sell_price: sell_price) }

  describe 'database validations' do
    describe 'general' do
      it 'successfully creates a sales record' do
        expect(sale1.save!).to be true
      end
    end

    describe 'foreign key product_id' do
      it 'raises RecordInvalid error if we try to create a record without product_id' do
        expect { sale2.save! }.to raise_error ActiveRecord::RecordInvalid
      end
    end

    describe 'date' do
      it 'stores the date in the YYYY-mm-dd HH:MM:SS format' do
        expect(sale1.date).to eq DateTime.parse('2020-10-27 00:00:00')
      end

      it 'stores the date in the YYYY-mm-dd HH:MM:SS format - falsy' do
        expect(sale1.date).not_to eq DateTime.parse('2020-10-27 00:00:01')
      end

      it 'stores the date as nil if no date provided' do
        expect(sale2.date).to be nil
      end
    end

    describe 'money types' do
      it 'stores the return_amount in the format DDDD.DD' do
        expect(sale1.return_amount).to eq return_amount
      end

      it 'stores the return_amount in the format DDDD.DD - falsy' do
        expect(sale1.return_amount).not_to eq return_amount + 0.1
      end

      it 'stores the buy_price in the format DDDD.DD' do
        expect(sale1.buy_price).to eq buy_price
      end

      it 'stores the buy_price in the format DDDD.DD - falsy' do
        expect(sale1.buy_price).not_to eq buy_price + 0.1
      end

      it 'stores the sell_price in the format DDDD.DD' do
        expect(sale1.sell_price).to eq sell_price
      end

      it 'stores the sell_price in the format DDDD.DD - falsy' do
        expect(sale1.sell_price).not_to eq sell_price + 0.1
      end
    end

  end

end
