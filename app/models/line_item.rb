class LineItem < ApplicationRecord
  belongs_to :product
  before_save :asigne_total

  def asigne_total
    self.totalPrice = self.quantity * self.product.price.to_f
  end
end
