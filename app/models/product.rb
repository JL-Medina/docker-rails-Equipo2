class Product < ApplicationRecord
  belongs_to :category
  has_many :category

  validates :name, presence: true
  validates :name, uniqueness: true
end
