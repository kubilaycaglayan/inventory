require 'rails_helper'

RSpec.describe Payment, type: :model do
  let(:comission) { 420 }
  let(:kind) { 'Card' }
  let(:bank) { 'HSBC' }
  let(:p1) { Product.create(code: 'WAT24480TR', definition: 'Washing Machine') }
  let(:s1) do
    Sale.create(date: '2020-10-27', product_id: p1.id, return_amount: 1000, buy_price: 1000, sell_price: 1000)
  end
  let(:payment1) { Payment.new(kind: kind, bank: bank, comission: comission, sale_id: s1.id) }
  let(:payment2) { Payment.new(kind: kind, bank: bank, comission: comission) }
  describe 'database validations' do
    describe 'general' do
      it 'successfully creates a payment record' do
        expect(payment1.save!).to be true
      end

      it 'creates the payment with default commision value 0' do
        expect(Payment.new(sale_id: s1.id).comission).to eq 0
      end

      it 'creates the payment with default commision value 0 - value' do
        expect(Payment.new(sale_id: s1.id).comission).not_to eq 1
      end
    end

    describe 'foreign key validation sale must exist' do
      it 'raises RecordInvalid error if we try to create a record without sale_id' do
        expect { payment2.save! }.to raise_error ActiveRecord::RecordInvalid
      end
    end

    describe 'money format' do
      it 'stores the comission in DDDD.DD format' do
        expect(payment1.comission).to eq comission
      end

      it 'stores the comission in DDDD.DD format - falsy' do
        expect(payment1.comission).not_to eq comission + 0.1
      end
    end

    describe 'kind and bank storage' do
      it 'successfully stores the bank as a string' do
        expect(payment1.bank).to eq bank
      end

      it 'successfully stores the bank as a string - falsy' do
        expect(payment1.bank).not_to eq 'bank'
      end

      it 'successfully stores the kind as a string' do
        expect(payment1.kind).to eq kind
      end

      it 'successfully stores the kind as a string - falsy' do
        expect(payment1.kind).not_to eq 'kind'
      end
    end
  end
end
