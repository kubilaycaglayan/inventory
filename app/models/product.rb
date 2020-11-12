class Product < ApplicationRecord
  include AutoAddable
  include Identifiable

  after_create :assign_categorying_callback, :create_outstanding

  has_many :categoryings
  has_many :categories, through: :categoryings

  has_many :sales

  class << self
    def sku(code)
      Product.find_by(code: code)
    end
  end

  private

  def assign_categorying_callback
    Product.assign_categorying(self)
  end

  def create_outstanding
    Outstanding.create(product_id: id)
  end
end
