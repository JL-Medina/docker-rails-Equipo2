class Budget < ApplicationRecord
  belongs_to :user
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items

  validates :name, presence: true
  validates :name, uniqueness: true

  def add_product(product)
    current_item = line_items.find_by(product_id: product.id)
    if current_item
      current_item.increment(:quantity)
    else
      current_item = line_items.build(product_id: product.id)
    end
    current_item
  end
end
