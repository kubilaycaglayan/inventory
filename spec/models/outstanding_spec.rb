require 'rails_helper'

RSpec.describe Outstanding, type: :model do
  let(:value1) { 5 }
  let(:value2) { -5 }
  let(:p1) { Product.create(code: 'WAT24480TR', definition: 'Washing Machine') }
  let(:outstanding1) { product_id: p1.id, value: value1 }
  let(:outstanding2) { value: value2 }

  describe 'database validations' do
    describe 'general' do
      it 'successfully creates a record in the DB' do
        expect(outstanding1.save!).to be true
      end
    end

    describe 'foreign key validation' do
      it 'raises RecordInvalid error if we try to create a record without product_id' do
        expect { outstanding2.save! }.to raise_error ActiveRecord::RecordInvalid
      end
    end

    describe 'value type is integer' do
      it 'stores the value as integer' do
        expect(outstanding1.value).to be value1
      end

      it 'stores the value as negative integer' do
        expect(outstanding2.value).to be value2
      end

      it 'stores the value as negative integer - falsy' do
        expect(outstanding2.value).not_to be value2 + 1
      end
    end
  end
end
