require 'rails_helper'

RSpec.describe Sale, type: :model do
  let(:return_amount) { 1950.50 }
  let(:buy_price) { 5500.00 }
  let(:sell_price) { 6200.50 }
  let(:p1) { Product.create(code: 'WAT24480TR', definition: 'Washing Machine') }
  let(:sale1) do
    Sale.new(date: '2020-10-27', product_id: p1.id, return_amount: return_amount, buy_price: buy_price,
             sell_price: sell_price)
  end
  let(:sale2) { Sale.new(return_amount: return_amount, buy_price: buy_price, sell_price: sell_price) }
  let(:sale3) do
    Sale.new(date: '2020-10-27', product_id: p1.id, return_amount: return_amount, buy_price: buy_price,
             sell_price: sell_price)
  end
  let(:sale4) do
    Sale.create(date: DateTime.new, product_id: p1.id, return_amount: 0, buy_price: 900, sell_price: 1000)
  end

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

    describe 'default values' do
      it 'defaults the buy price to 0' do
        expect(Sale.create(product_id: p1.id).buy_price).to eq 0
      end

      it 'defaults the buy price to 0 - falsy' do
        expect(Sale.create(product_id: p1.id).buy_price).not_to eq 0.1
      end

      it 'defaults the sell price to 0' do
        expect(Sale.create(product_id: p1.id).sell_price).to eq 0
      end

      it 'defaults the sell price to 0 - falsy' do
        expect(Sale.create(product_id: p1.id).sell_price).not_to eq 0.1
      end
    end
  end

  describe 'instance methods' do
    describe 'profit' do
      it 'returns a hash with code key' do
        expect(sale4.profit[:code]).to eq p1.code
      end

      it 'returns a hash with margin' do
        expect(sale4.profit[:margin]).to eq 10
      end

      it 'returns a hash with margin - falsy' do
        expect(sale4.profit[:margin]).not_to eq 11
      end

      it 'returns a hash with net' do
        expect(sale4.profit[:net]).to eq 1000
      end

      it 'returns a hash with net - falsy' do
        expect(sale4.profit[:net]).not_to eq 1001
      end

      it 'returns a hash with profit' do
        expect(sale4.profit[:profit]).to eq 100
      end

      it 'returns a hash with profit - falsy' do
        expect(sale4.profit[:profit]).not_to eq 101
      end
    end
  end

  describe 'callbacks' do
    describe 'after create' do
      describe 'add_payment_record' do
        it 'has an empty Payment model initially' do
          expect(Payment.count).to eq 0
        end

        it 'automatically adds a payment record for every sale' do
          sale4
          expect(sale4.payment).to eq Payment.find_by(sale_id: sale4.id)
        end
      end
    end
  end
end
