require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:p1) { Product.new(code: 'WAT24480TR', definition: 'Washing Machine') }

  describe 'validation' do
    it 'creates a product with code and definition' do
      expect(p1.save).to be true
    end

    it 'doesn\'t create a product without code' do
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
end
