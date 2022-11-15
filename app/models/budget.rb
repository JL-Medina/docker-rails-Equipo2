class Budget < ApplicationRecord
  belongs_to :user

  validates :name, :expiration_date , :create_date, presence: true
  validates :name, uniqueness: true
end
