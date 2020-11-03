class Categorying < ApplicationRecord
  include Identifiable
  belongs_to :category
  belongs_to :product
end
