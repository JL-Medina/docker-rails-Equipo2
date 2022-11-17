class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



  #validates :name , :lastname, :email,   presence: true
  validates :email  , uniqueness: {case_insensitive: false}
  validate :due_date_validity
  
  EMAIL_REGEX = /\A
      [^\s@]+ # non-at-sign characters, at least one
      @       # at-sign
      [^\s.@] # non-at-sign and non-period character
      [^\s@]* # 0 or more non-at-sign characters, accepts any number of periods
      .      # period
      [^\s@]* # 0 or more non-at-sign characters, accepts any number of periods
      [^\s.@] # non-at-sign and non-period character
      \z/x

  def is_a_valid_email?(email)
    if (email = EMAIL_REGEX)
      return true 
    end 
  end

  def birth_date_validity
    return if fecha_nac.blank?
    return if fecha_nac < Date.today
    errors.add :fecha_nac 
  end
  
  def authenticate_user!(opts={})
    if user_signed_in?
      super 
    else
      if controller_name == "invitations" && (action_name == "edit" || action_name == "update" )
        super
      else
        if params[:red].present?
          if is_ignored_back_url_action?
            super
          else
            redirect_to new_user_session_path(red: params[:red],back_url: back_url)
          end
        else
          if is_ignored_back_url_action?
            super
          else
            redirect_to new_user_session_path(back_url: back_url)
          end
        end
      end
    end
  end
end
