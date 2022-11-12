class User < ApplicationRecord



  validates :name , :lastname, :email,   presence: true
  validates :email  , uniqueness: {case_insensitive: false}
  validate :due_date_validity

  def due_date_validity
    return if fecha_nac.blank?
    return if fecha_nac < Date.today
    errors.add :fecha_nac 
  end
end
