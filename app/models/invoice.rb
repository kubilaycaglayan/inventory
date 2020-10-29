class Invoice < ApplicationRecord
  after_create :check_new_product



  private
  def check_new_product
    Product.create_product_if_not_exist([[self.product_code, self.definition]])
  end
end
