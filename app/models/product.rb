class Product < ApplicationRecord
  include AutoAddable
  include Identifiable

  after_create :assign_categorying_callback

  has_many :categoryings

  private

  def assign_categorying_callback
    Product.assign_categorying(self)
  end
end
