class Product < ApplicationRecord
  include AutoAddable
  include Identifiable

  after_create :assign_categorying_callback, :create_outstanding

  has_many :categoryings

  private

  def assign_categorying_callback
    Product.assign_categorying(self)
  end

  def create_outstanding
    Outstanding.create(product_id: self.id)
  end
end
