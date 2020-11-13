require 'rails_helper'
require_relative '../../../../app/models/concerns/unit_operations/profit_helper'

RSpec.describe ProfitHelper, type: :helper do
  describe 'calculate_profit' do
    it 'returns a hash with net, property' do
      expect(calculate_profit[:net]).to eq 0
    end

    it 'returns a hash with net, property - falsy' do
      expect(calculate_profit[:net]).not_to eq 1
    end

    it 'returns a hash with profit property' do
      expect(calculate_profit[:profit]).to eq 0
    end

    it 'returns a hash with profit property - falsy' do
      expect(calculate_profit[:profit]).not_to eq 1
    end

    it 'returns a hash with margin property' do
      expect(calculate_profit[:margin]).to eq 0
    end

    it 'returns a hash with margin property - falsy' do
      expect(calculate_profit[:margin]).not_to eq 1
    end

    it 'returns a hash - false' do
      expect(calculate_profit[:something]).to be_nil
    end

    it '🔢 calculates the net' do
      expect(calculate_profit(1000, 100, 1200)[:net]).to eq 1100
    end

    it '🔢 calculates the profit' do
      expect(calculate_profit(1000, 100, 1200)[:profit]).to eq 100
    end

    it '🔢 calculates the margin' do
      expect(calculate_profit(900, 0, 1000)[:margin]).to eq 10
    end
  end
end
