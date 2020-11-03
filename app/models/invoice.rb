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
      result = {
        status: false,
        message: '',
        invoice: nil,
        value: nil
      }

      fifo_result = fifo(product_code, nth)

      if fifo_result.instance_of?(String)
        result[:message] = fifo_result
      else
        result[:status] = true
        result[:invoice] = fifo_result
        result[:value] = fifo_result.sum / fifo_result.quantity
      end

      result
    end

    def fifo(product_code, nth)
      invoices = Invoice.where(product_code: product_code).order(invoice_date: :desc)
      sum = 0

      return 'Product doesn\'t exist.' if invoices.count.zero?
      return 'Invoice cannot be found' if nth > invoices.sum(:quantity)

      invoices.each do |invoice|
        sum += invoice.quantity
        return invoice if sum >= nth
      end

      'En error occured.'
    end
  end

  private

  def check_new_product
    Product.create_product_if_not_exist([[product_code, definition]])
  end
end
