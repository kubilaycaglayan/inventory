class Category < ApplicationRecord
  before_create :increase_order_in_kind
  has_many :categoryings, dependent: :destroy

  private

  def increase_order_in_kind
    return if Category.where(kind: kind).count < 1

    self.order_in_kind = Category.where(kind: kind).maximum('order_in_kind') + 1
  end
end
