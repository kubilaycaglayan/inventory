module AutoAddable
  extend ActiveSupport::Concern

  class_methods do
    def create_product_if_not_exist(product_array)
      # shape = [[product_code1, product_definition1], [product_code2, product_definition2]]
      current_products = Product.pluck(:code)
      product_array.each do |code_definition_pair|
        code = code_definition_pair.first
        definition = code_definition_pair.last
        next if current_products.include? code

        Product.create(
          {
            code: code,
            definition: definition
          }
        )
      end
    end
  end
end
