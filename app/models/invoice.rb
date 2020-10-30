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

    def cost_calculator(product_code, nth)
      result = fifo(product_code, nth)

      return result if result.class == String

      result.sum / result.quantity
    end

    def fifo(product_code, nth)
      invoices = Invoice.where(product_code: product_code).order(invoice_date: :desc)
      sum = 0

      return 'Product doesn\'t exist.' if invoices.count.zero?
      return 'Invoice cannot be found' if nth > invoices.sum(:quantity)

      invoices.each do |invoice|
        target = invoice
        sum += invoice.quantity
        return invoice if sum >= nth
      end

      nil
    end
  end

  private
  def check_new_product
    Product.create_product_if_not_exist([[self.product_code, self.definition]])
  end
end
