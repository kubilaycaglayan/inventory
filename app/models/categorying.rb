class Categorying < ApplicationRecord
  belongs_to :category
  belongs_to :product
end