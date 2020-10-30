require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:product_1) { Product.create(code: 'WAT24480TR', definition: 'definition') }
  let(:category_1) { Category.create(kind: 'Bosch', definition: 'Washing Machines', order_in_kind: 1)}

  describe 'database validations' do
    it 'successfully creates a record' do
      expect(category_1.save).to be true
    end

    it 'successfully creates a record - falsy' do
      expect(category_1.save).not_to be false
    end

    describe 'kind' do

    end

    describe 'definition' do

    end

    describe 'order_in_kind' do

    end
  end
end
