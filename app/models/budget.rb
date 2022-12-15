class Budget < ApplicationRecord
  belongs_to :user
  before_save :total_budget, :quantity_budget 

  def total_budget
    self.total_budget =  LineItem.where(budget_id: self.id).sum(:totalprice)
  end

  def quantity_budget
    self.quantity_products =  LineItem.where(budget_id: self.id).sum(:quantity)
  end

  validates :name, presence: true
  validates :name, uniqueness: true
end
