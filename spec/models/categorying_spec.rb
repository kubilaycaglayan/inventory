require 'rails_helper'

RSpec.describe Categorying, type: :model do
  let(:product_1) { Product.create(code: 'WAT24480TR', definition: 'definition') }
  let(:product_2) { Product.create(code: '43PFS5302', definition: 'definition') }
  let(:product_3) { Product.create(code: 'BGB7330', definition: 'definition') }
  let(:product_4) { Product.create(code: 'DWK65AD20R', definition: 'definition') }
  let(:product_5) { Product.create(code: 'HGD745360T', definition: 'definition') }
  let(:product_6) { Product.create(code: 'KGN56AIF0N', definition: 'definition') }
  let(:product_7) { Product.create(code: 'MFW3520W', definition: 'definition') }
  let(:product_8) { Product.create(code: 'HBN331S2T', definition: 'definition') }
  let(:product_9) { Product.create(code: 'PBP6C2B80O', definition: 'definition') }
  let(:product_10) { Product.create(code: 'SMS46IW00T', definition: 'definition') }

  let(:category_1) { Category.create(kind: 'Bosch', definition: 'Washing Machines', order_in_kind: 1) }

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
        categorying_3.category_id = Category.last.id + 1
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
end
