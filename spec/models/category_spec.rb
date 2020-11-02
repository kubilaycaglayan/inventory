require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:product_1) { Product.create(code: 'WAT24480TR', definition: 'definition') }
  let(:category_1) { Category.create(kind: 'Bosch', definition: 'Washing Machines', order_in_kind: 1)}
  let(:category_2) { Category.create(kind: 'Bosch', definition: 'Washing Machines')}
  let(:category_info_1) { { kind: 'Bosch', definition: 'Washing Machines' } }
  let(:category_info_2) { { kind: 'Muhasebe', definition: 'Washing Machines' } }

  describe 'database validations' do
    it 'successfully creates a record' do
      expect(category_1.save).to be true
    end

    it 'successfully creates a record - falsy' do
      expect(category_1.save).not_to be false
    end

    describe 'order_in_kind' do
      it 'defaults to 1' do
        expect(category_2.order_in_kind).to be 1
        expect(category_2.order_in_kind).not_to be 2
      end

      it 'automatically increases in a specific kind' do
        category_1
        expect(category_2.order_in_kind).to be 2
        expect(category_2.order_in_kind).not_to be 1

        expect(Category.create(category_info_1).order_in_kind).to be 3
        expect(Category.create(category_info_1).order_in_kind).not_to be 3

        expect(Category.create(category_info_1).order_in_kind).to be 5
        expect(Category.create(category_info_1).order_in_kind).not_to be 5

        expect(Category.create(category_info_2).order_in_kind).to be 1
        expect(Category.create(category_info_2).order_in_kind).to be 2
      end
    end
  end
end
