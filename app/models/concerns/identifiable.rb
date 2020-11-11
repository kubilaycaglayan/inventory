# rubocop:disable Metrics/BlockLength, Metrics/CyclomaticComplexity
module Identifiable
  extend ActiveSupport::Concern

  class_methods do
    def assign_categorying(product)
      categories = {
        product: product.code,
        bosch: bosch_category_identifier(product),
        muhasebe: muhasebe_category_identifier(product)
      }
    end

    def bosch_category_identifier(product)
      order_in_kind = case product.code.first.upcase
                      when 'A'
                        1
                      when 'B'
                        3
                      when 'D'
                        2
                      when 'G'
                        1
                      when 'H'
                        2
                      when 'K'
                        1
                      when 'L'
                        1
                      when 'M'
                        3
                      when 'N'
                        return
                      when 'P'
                        2
                      when 'Q'
                        return
                      when 'R'
                        1
                      when 'S'
                        1
                      when 'T'
                        3
                      when 'W'
                        1
                      when /[0-9]/
                        6
                      else
                        return
                      end
      Categorying.create(product_id: product.id,
                         category_id: Category.find_by(kind: 'Bosch', order_in_kind: order_in_kind).id)
    end

    def muhasebe_category_identifier(product)
      order_in_kind = case product.code.first.upcase
                      when 'A'
                        8
                      when 'B'
                        9
                      when 'D'
                        6
                      when 'G'
                        3
                      when 'H'
                        4
                      when 'K'
                        3
                      when 'L'
                        7
                      when 'M'
                        8
                      when 'N'
                        8
                      when 'P'
                        5
                      when 'Q'
                        return
                      when 'R'
                        8
                      when 'S'
                        2
                      when 'T'
                        8
                      when 'W'
                        1
                      when /[0-9]/
                        7
                      else
                        return
                      end
      Categorying.create(product_id: product.id,
                         category_id: Category.find_by(kind: 'Muhasebe', order_in_kind: order_in_kind).id)
    end
  end
end
# rubocop:enable Metrics/BlockLength, Metrics/CyclomaticComplexity
