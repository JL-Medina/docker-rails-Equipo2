class User < ApplicationRecord



  validates :name , :lastname, :email,   presence: true
  validates :email  , uniqueness: {case_insensitive: false}
  validate :due_date_validity

  def is_a_valid_email?(email)
    (email =~ /^(([A-Za-z0-9]*\.+*_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\+)|([A-Za-z0-9]+\+))*[A-Z‌​a-z0-9]+@{1}((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,4}$/i)
  end
  EMAIL_REGEX = /\A
      [^\s@]+ # non-at-sign characters, at least one
      @       # at-sign
      [^\s.@] # non-at-sign and non-period character
      [^\s@]* # 0 or more non-at-sign characters, accepts any number of periods
      .      # period
      [^\s@]* # 0 or more non-at-sign characters, accepts any number of periods
  [^\s.@] # non-at-sign and non-period character
      \z/x


  def due_date_validity
    return if fecha_nac.blank?
    return if fecha_nac < Date.today
    errors.add :fecha_nac 
  end
end
