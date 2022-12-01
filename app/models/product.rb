class Product < ApplicationRecord
  before_destroy :not_referenced_by_any_line_item
  belongs_to :category
  #has_many :category
  has_many :line_items
  has_many :budgets, through: :line_items

  validates :name, presence: true
  #validates :name, uniqueness: true

  private
  def not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, "Line items present")
      throw :abort
    end
  end
end
