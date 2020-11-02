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
        return
      when 'P'
        order_in_kind = 2
      when 'Q'
        return
      when 'R'
        order_in_kind = 1
      when 'S'
        order_in_kind = 1
      when 'T'
        order_in_kind = 3
      when 'W'
        order_in_kind = 1
      else
        return
      end

      Categorying.create( product_id: product.id, category_id: Category.find_by(kind: 'Bosch', order_in_kind: order_in_kind).id)
    end

    def muhasebe_category_identifier(product)
      case product.code.first
      when 'A'
        order_in_kind = 8
        return
      when 'B'
        order_in_kind = 9
        return
      when 'D'
        order_in_kind = 6
        return
      when 'G'
        order_in_kind = 3
        return
      when 'H'
        order_in_kind = 4
        return
      when 'K'
        order_in_kind = 3
        return
      when 'L'
        order_in_kind = 7
        return
      when 'M'
        order_in_kind = 8
        return
      when 'N'
        order_in_kind = 8
        return
      when 'P'
        order_in_kind = 5
        return
      when 'Q'
        return
      when 'R'
        order_in_kind = 8
        return
      when 'S'
        order_in_kind = 2
        return
      when 'T'
        order_in_kind = 8
        return
      when 'W'
        order_in_kind = 1
        return
      else
        return
      end

      Categorying.create( product_id: product.id, category_id: Category.find_by(kind: 'Muhasebe', order_in_kind: order_in_kind).id)
    end
  end
end
