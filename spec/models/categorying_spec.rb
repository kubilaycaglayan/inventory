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
        it 'identifies the category of a bosch kind product - solo' do
          new_categorying = Categorying.bosch_category_identifier(product_1)
          expect(new_categorying.product_id).to be product_1.id
          expect(new_categorying.category_id).to be Category.where(kind: 'Bosch', definition: 'Solo').first.id
        end

        it 'identifies the category of a bosch kind product - solo' do
          new_categorying = Categorying.bosch_category_identifier(product_1)
          expect(new_categorying.product_id).to be product_1.id
          expect(new_categorying.category_id).to be Category.where(kind: 'Bosch', definition: 'Solo').first.id
        end

        it 'identifies the category of a bosch kind product - televizyon' do
          new_categorying = Categorying.bosch_category_identifier(product_2)
          expect(new_categorying.product_id).to be product_2.id
          expect(new_categorying.category_id).to be Category.where(kind: 'Bosch', definition: 'Televizyon').first.id
        end

        it 'identifies the category of a bosch kind product - kea' do
          new_categorying = Categorying.bosch_category_identifier(product_7)
          expect(new_categorying.product_id).to be product_7.id
          expect(new_categorying.category_id).to be Category.where(kind: 'Bosch', definition: 'Küçük Ev Aleti').first.id
        end

        it 'identifies the category of a bosch kind product - Ankastre' do
          new_categorying = Categorying.bosch_category_identifier(product_5)
          expect(new_categorying.product_id).to be product_5.id
          expect(new_categorying.category_id).to be Category.where(kind: 'Bosch', definition: 'Ankastre').first.id
        end
      end

      describe 'muhasebe category identifier' do

        it 'identifies the category of a bosch kind product - Çamaşır Makinesi' do
          new_categorying = Categorying.muhasebe_category_identifier(product_1)
          expect(new_categorying.product_id).to be product_1.id
          expect(new_categorying.category_id).to be Category.where(kind: 'Muhasebe', definition: 'Çamaşır Makinesi').first.id
        end

        it 'identifies the category of a bosch kind product - Bulaşık Makinesi' do
          new_categorying = Categorying.muhasebe_category_identifier(product_10)
          expect(new_categorying.product_id).to be product_10.id
          expect(new_categorying.category_id).to be Category.where(kind: 'Muhasebe', definition: 'Bulaşık Makinesi').first.id
        end

        it 'identifies the category of a bosch kind product - Buzdolabı' do
          new_categorying = Categorying.muhasebe_category_identifier(product_6)
          expect(new_categorying.product_id).to be product_6.id
          expect(new_categorying.category_id).to be Category.where(kind: 'Muhasebe', definition: 'Buzdolabı').first.id
        end

        it 'identifies the category of a bosch kind product - Fırın' do
          new_categorying = Categorying.muhasebe_category_identifier(product_5)
          expect(new_categorying.product_id).to be product_5.id
          expect(new_categorying.category_id).to be Category.where(kind: 'Muhasebe', definition: 'Fırın').first.id
        end

        it 'identifies the category of a bosch kind product - Ocak' do
          new_categorying = Categorying.muhasebe_category_identifier(product_9)
          expect(new_categorying.product_id).to be product_9.id
          expect(new_categorying.category_id).to be Category.where(kind: 'Muhasebe', definition: 'Ocak').first.id
        end

        it 'identifies the category of a bosch kind product - Davlumbaz' do
          new_categorying = Categorying.muhasebe_category_identifier(product_4)
          expect(new_categorying.product_id).to be product_4.id
          expect(new_categorying.category_id).to be Category.where(kind: 'Muhasebe', definition: 'Davlumbaz').first.id
        end

        it 'identifies the category of a bosch kind product - Televizyon' do
          new_categorying = Categorying.muhasebe_category_identifier(product_2)
          expect(new_categorying.product_id).to be product_2.id
          expect(new_categorying.category_id).to be Category.where(kind: 'Muhasebe', definition: 'Televizyon').first.id
        end

        it 'identifies the category of a bosch kind product - Küçük Ev Aleti' do
          new_categorying = Categorying.muhasebe_category_identifier(product_7)
          expect(new_categorying.product_id).to be product_7.id
          expect(new_categorying.category_id).to be Category.where(kind: 'Muhasebe', definition: 'Küçük Ev Aleti').first.id
        end

        it 'identifies the category of a bosch kind product - Elektrikli Süpürge' do
          new_categorying = Categorying.muhasebe_category_identifier(product_3)
          expect(new_categorying.product_id).to be product_3.id
          expect(new_categorying.category_id).to be Category.where(kind: 'Muhasebe', definition: 'Elektrikli Süpürge').first.id
        end

      end
    end
  end
end
