class Categorying < ApplicationRecord
  belongs_to :category
  belongs_to :product

  class << self
    def assign_categorying(product)
      categories = {
        product: product.code,
        bosch: bosch_category_identifier(product),
        muhasebe: muhasebe_category_identifier(product) }

      Categorying.create(product_id: product.code, category_id: categories['bosch'].id)
      Categorying.create(product_id: product.code, category_id: categories['muhasebe'].id)
    end

    def bosch_category_identifier(product)
      case product.code.first
      when 'A'
        order_in_kind = 1
      when 'B'
        order_in_kind = 3
      when 'D'
        order_in_kind = 2
      when 'G'
        order_in_kind = 1
      when 'H'
        order_in_kind = 2
      when 'K'
        order_in_kind = 1
      when 'L'
        order_in_kind = 1
      when 'M'
        order_in_kind = 3
      when 'N'
        order_in_kind = 0
      when 'P'
        order_in_kind = 2
      when 'Q'
        order_in_kind = 0
      when 'R'
        order_in_kind = 1
      when 'S'
        order_in_kind = 1
      when 'T'
        order_in_kind = 3
      when 'W'
        order_in_kind = 1
      when /[0-9]/
        order_in_kind = 6
      else
        order_in_kind = 0
      end
      Categorying.create( product_id: product.id, category_id: Category.find_by(kind: 'Bosch', order_in_kind: order_in_kind).id)
    end

    def muhasebe_category_identifier(product)
      case product.code.first
      when 'A'
        order_in_kind = 8
      when 'B'
        order_in_kind = 9
      when 'D'
        order_in_kind = 6
      when 'G'
        order_in_kind = 3
      when 'H'
        order_in_kind = 4
      when 'K'
        order_in_kind = 3
      when 'L'
        order_in_kind = 7
      when 'M'
        order_in_kind = 8
      when 'N'
        order_in_kind = 8
      when 'P'
        order_in_kind = 5
      when 'Q'
        order_in_kind = 0
      when 'R'
        order_in_kind = 8
      when 'S'
        order_in_kind = 2
      when 'T'
        order_in_kind = 8
      when 'W'
        order_in_kind = 1
      when /[0-9]/
        order_in_kind = 7
      else
        order_in_kind = 0
      end

      Categorying.create( product_id: product.id, category_id: Category.find_by(kind: 'Muhasebe', order_in_kind: order_in_kind).id)
    end
  end
end
