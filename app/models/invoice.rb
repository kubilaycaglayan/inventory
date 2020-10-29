class Invoice < ApplicationRecord
  after_create :check_new_product

  class << self
    def insert_all(...)
      result = super(...)
      check_new_product_bulk(result)
      result
    end

    def upsert_all(...)
      result = super(...)
      check_new_product_bulk(result)
      result
    end

    def check_new_product_bulk(result)
      Product.create_product_if_not_exist(result.rows)
    end
  end

  private
  def check_new_product
    Product.create_product_if_not_exist([[self.product_code, self.definition]])
  end
end
