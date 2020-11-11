require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product_code_1) { 'product_1' }
  let(:product_code_2) { 'product_2' }
  let(:product_code_3) { 'product_3' }

  let(:definition_1) { 'definition_1' }
  let(:definition_2) { 'definition_2' }
  let(:definition_3) { 'definition_3' }

  let(:p1) { Product.new(code: product_code_1, definition: definition_1) }
  let(:p2) { Product.new(code: product_code_2, definition: definition_2) }
  let(:p3) { Product.new(code: product_code_3, definition: definition_3) }

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

  describe 'database validations' do
    it 'creates a product with code and definition' do
      expect(p1.save).to be true
    end

    it 'doesn\'t create a product without code' do
      p1.code = nil
      expect { p1.save }.to raise_error ActiveRecord::NotNullViolation
    end

    it 'doesn\'t create a product if the invoice addition was not successful' do
      p1.code = nil
      expect { p1.save }.to raise_error ActiveRecord::NotNullViolation
    end

    it 'still creates a product without definition' do
      p1.definition = nil
      expect(p1.save).to be true
    end

    it 'has unique constraint on code column' do
      p1.save
      p2 = p1.dup
      expect { p2.save }.to raise_error ActiveRecord::RecordNotUnique
    end
  end

  describe 'class methods' do
    describe 'create_product_if_not_exist' do
      it 'adds new products' do
        expect(Product.count).to be 0
        input = [
          [product_code_1, definition_1],
          [product_code_2, definition_2],
          [product_code_3, definition_3]
        ]
        Product.create_product_if_not_exist(input)
        expect(Set.new(Product.pluck(:code))).to match Set.new [
          product_code_1,
          product_code_2,
          product_code_3
        ]
      end

      it 'creates new products if they don\'t exist' do
        expect(Product.count).to be 0
        p1.save!
        expect(Product.count).to be 1
        input = [
          [product_code_1, definition_1],
          [product_code_2, definition_2],
          [product_code_3, definition_3]
        ]
        Product.create_product_if_not_exist(input)
        expect(Set.new(Product.pluck(:code))).to match Set.new [
          product_code_1,
          product_code_2,
          product_code_3
        ]
        expect(Product.count).to be 3
        expect(Product.count).not_to be 1
      end
    end
  end

  describe 'callbacks' do
    describe 'category assignment' do
      describe 'bosch category identifier' do
        it ' - solo' do
          new_categorying = Product.bosch_category_identifier(product_1)
          expect(new_categorying.product_id).to be product_1.id
          expect(new_categorying.category_id).to be Category.where(kind: 'Bosch', definition: 'Solo').first.id
        end

        it ' - solo' do
          new_categorying = Product.bosch_category_identifier(product_1)
          expect(new_categorying.product_id).to be product_1.id
          expect(new_categorying.category_id).to be Category.where(kind: 'Bosch', definition: 'Solo').first.id
        end

        it ' - televizyon' do
          new_categorying = Product.bosch_category_identifier(product_2)
          expect(new_categorying.product_id).to be product_2.id
          expect(new_categorying.category_id).to be Category.where(kind: 'Bosch', definition: 'Televizyon').first.id
        end

        it ' - kea' do
          new_categorying = Product.bosch_category_identifier(product_7)
          expect(new_categorying.product_id).to be product_7.id
          expect(new_categorying.category_id).to be Category.where(kind: 'Bosch', definition: 'Küçük Ev Aleti').first.id
        end

        it ' - Ankastre' do
          new_categorying = Product.bosch_category_identifier(product_5)
          expect(new_categorying.product_id).to be product_5.id
          expect(new_categorying.category_id).to be Category.where(kind: 'Bosch', definition: 'Ankastre').first.id
        end
      end

      describe 'muhasebe category identifier' do
        it ' - Çamaşır Makinesi' do
          new_categorying = Product.muhasebe_category_identifier(product_1)
          expect(new_categorying.product_id).to be product_1.id
          expect(new_categorying.category_id).to be Category.where(kind: 'Muhasebe',
                                                                   definition: 'Çamaşır Makinesi').first.id
        end

        it ' - Bulaşık Makinesi' do
          new_categorying = Product.muhasebe_category_identifier(product_10)
          expect(new_categorying.product_id).to be product_10.id
          expect(new_categorying.category_id).to be Category.where(kind: 'Muhasebe',
                                                                   definition: 'Bulaşık Makinesi').first.id
        end

        it ' - Buzdolabı' do
          new_categorying = Product.muhasebe_category_identifier(product_6)
          expect(new_categorying.product_id).to be product_6.id
          expect(new_categorying.category_id).to be Category.where(kind: 'Muhasebe', definition: 'Buzdolabı').first.id
        end

        it ' - Fırın' do
          new_categorying = Product.muhasebe_category_identifier(product_5)
          expect(new_categorying.product_id).to be product_5.id
          expect(new_categorying.category_id).to be Category.where(kind: 'Muhasebe', definition: 'Fırın').first.id
        end

        it ' - Ocak' do
          new_categorying = Product.muhasebe_category_identifier(product_9)
          expect(new_categorying.product_id).to be product_9.id
          expect(new_categorying.category_id).to be Category.where(kind: 'Muhasebe', definition: 'Ocak').first.id
        end

        it ' - Davlumbaz' do
          new_categorying = Product.muhasebe_category_identifier(product_4)
          expect(new_categorying.product_id).to be product_4.id
          expect(new_categorying.category_id).to be Category.where(kind: 'Muhasebe', definition: 'Davlumbaz').first.id
        end

        it ' - Televizyon' do
          new_categorying = Product.muhasebe_category_identifier(product_2)
          expect(new_categorying.product_id).to be product_2.id
          expect(new_categorying.category_id).to be Category.where(kind: 'Muhasebe', definition: 'Televizyon').first.id
        end

        it ' - Küçük Ev Aleti' do
          new_categorying = Product.muhasebe_category_identifier(product_7)
          expect(new_categorying.product_id).to be product_7.id
          expect(new_categorying.category_id).to be Category.where(kind: 'Muhasebe',
                                                                   definition: 'Küçük Ev Aleti').first.id
        end

        it ' - Elektrikli Süpürge' do
          new_categorying = Product.muhasebe_category_identifier(product_3)
          expect(new_categorying.product_id).to be product_3.id
          expect(new_categorying.category_id).to be Category.where(kind: 'Muhasebe',
                                                                   definition: 'Elektrikli Süpürge').first.id
        end
      end
    end

    describe 'outstanding trigger' do
      it 'automatically creates an outstanding' do
        product_1
        expect(Outstanding.last.product_id).to eq product_1.id
      end

      it 'creates an outstanding with default value 0' do
        product_1
        expect(Outstanding.last.value).to eq 0
      end

      it 'value could be changed after initialization' do
        product_1
        Outstanding.find_by(product_id: product_1.id).update({value: 15})
        expect(Outstanding.find_by(product_id: product_1.id).value).to eq 15
      end

      it 'value could be changed after initialization - falsy' do
        product_1
        Outstanding.find_by(product_id: product_1.id).update({value: 15})
        expect(Outstanding.find_by(product_id: product_1.id).value).not_to eq 0
      end

      it 'automatically creates an outstanding - falsy' do
        product_1
        expect(Outstanding.last.product_id).not_to eq product_1.id + 1
      end
    end
  end

  describe 'associations' do
    describe 'categories' do
      let(:category_1) { Category.find_by(kind: 'Bosch', definition: 'Solo') }
      let(:category_2) { Category.find_by(kind: 'Muhasebe', definition: 'Çamaşır Makinesi') }

      it 'has many categoryings' do
        expect(product_1).to respond_to(:categoryings)
      end

      it 'has many categoryings - falsy' do
        expect(product_1).not_to respond_to(:categoryingss)
      end

      it 'has many categories' do
        expect(product_1).to respond_to(:categories)
      end

      it 'has many categories - falsy' do
        expect(product_1).not_to respond_to(:categoriess)
      end

      it 'returns the categories of a product' do
        expect(product_1.categories).to match [category_1, category_2]
      end

      it 'returns the categories of a product - falsy' do
        expect(product_1.categories).not_to match [category_2]
      end
    end

    describe 'categoryings' do
      let(:categoryings_1) { Categorying.where(product_id: product_1) }
      let(:categoryings_2) { Categorying.where(product_id: product_2) }

      it 'returns the categoryings of a product' do
        expect(product_1.categoryings).to match categoryings_1
      end

      it 'returns the categoryings of a product - falsy' do
        expect(product_1.categoryings).not_to match categoryings_2
      end

      it 'returns the categoryings of a product' do
        expect(product_2.categoryings).to match categoryings_2
      end

      it 'returns the categoryings of a product - falsy' do
        expect(product_2.categoryings).not_to match categoryings_1
      end
    end
  end
end
