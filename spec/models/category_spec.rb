require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:product_1) { Product.create(code: 'WAT24480TR', definition: 'definition') }
  let(:category_1) { Category.create(kind: 'Bosch', definition: 'Washing Machines', order_in_kind: 1) }
  let(:category_2) { Category.create(kind: 'Bosch', definition: 'Washing Machines') }
  let(:category_info_1) { { kind: 'Bosch', definition: 'Washing Machines' } }
  let(:category_info_2) { { kind: 'Muhasebe', definition: 'Washing Machines' } }

  let(:category_seed) { require_relative '../../db/seeds' }

  before(:all) { Category.destroy_all }

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

    describe 'seeding' do
      it 'successfullt seeds the initial categories' do
        Category.destroy_all
        expect(Category.count).to eq 0
        seed_categories
        expect(Category.where(kind: 'Bosch').count).to be 6
        expect(Category.where(kind: 'Bosch').count).not_to be 0
        expect(Category.where(kind: 'Muhasebe').count).to be 9
        expect(Category.where(kind: 'Muhasebe').count).not_to be 0

        expect(Category.where(kind: 'Bosch').pluck(:order_in_kind)).to match [1, 2, 3, 4, 5, 6]
        expect(Category.where(kind: 'Muhasebe').pluck(:order_in_kind)).to match [1, 2, 3, 4, 5, 6, 7, 8, 9]
      end
    end
  end
end
