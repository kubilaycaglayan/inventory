class Sale < ApplicationRecord
  belongs_to :product

  has_one :payment
end
