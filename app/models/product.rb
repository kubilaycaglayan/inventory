class Product < ApplicationRecord
  include AutoAddable

  has_many :categoryings
end
