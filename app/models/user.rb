class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :tasks

  before_create :ensure_authentication_token


  private

  def ensure_authentication_token
    loop do
      token  = Devise.friendly_token
      unless User.where(authentication_token: token).first
        self.authentication_token = token
        break token
      end
    end
  end

end

