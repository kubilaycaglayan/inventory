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
        expect(Set.new Product.pluck(:code)).to match Set.new [
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
        expect(Set.new Product.pluck(:code)).to match Set.new [
          product_code_1,
          product_code_2,
          product_code_3
        ]
        expect(Product.count).to be 3
        expect(Product.count).not_to be 1
      end
    end
  end
end
