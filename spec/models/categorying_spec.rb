require 'rails_helper'

RSpec.describe Categorying, type: :model do
  let(:product_1) { Product.create(code: 'WAT24480TR', definition: 'definition') }
  let(:category_1) { Category.create(kind: 'Bosch', definition: 'Washing Machines', order_in_kind: 1)}

  let(:categorying_1) { Categorying.new(category_id: category_1.id, product_id: product_1.id) }
  let(:categorying_2) { Categorying.new(category_id: category_1.id) }
  let(:categorying_3) { Categorying.new(product_id: product_1.id) }



  describe 'database validations' do
    it 'successfully creates a record' do

      expect(categorying_1.save).to be true
    end

    it 'successfully creates a record - falsy' do
      expect(categorying_1.save).not_to be false
    end

    describe 'category_id' do
      it 'is a required filed' do
        expect(categorying_3.save).to be false
        categorying_3.category_id = category_1.id
        expect(categorying_3.save).to be true
      end

      it 'category must exist' do
        expect(categorying_3.save).to be false
        categorying_3.category_id = 4
        expect { categorying_3.save! }.to raise_error ActiveRecord::RecordInvalid
      end
    end

    describe 'product_id' do
      it 'is a required filed' do
        expect(categorying_2.save).to be false
        categorying_2.product_id = product_1.id
        expect(categorying_2.save).to be true
      end

      it 'product must exist' do
        expect(categorying_2.save).to be false
        categorying_2.product_id = 4
        expect { categorying_2.save! }.to raise_error ActiveRecord::RecordInvalid
      end
    end
  end

  describe 'callbacks' do
    describe 'category assignment' do

      before(:all) do
        require_relative '../../db/seeds.rb'
      end

      describe 'bosch category identifier' do
        it 'identifies the category of a bosch kind product' do
          new_categorying = Categorying.bosch_category_identifier(product_1)
          expect(new_categorying.product_id).to be product_1.id
          expect(new_categorying.category_id).to be Category.where(kind: 'Bosch', definition: 'Solo').first.id
        end

        it 'identifies the category of a bosch kind product' do
          new_categorying = Categorying.bosch_category_identifier(product_1)
          expect(new_categorying.product_id).to be product_1.id
          expect(new_categorying.category_id).to be Category.where(kind: 'Bosch', definition: 'Solo').first.id
        end

      end
    end
  end
end
