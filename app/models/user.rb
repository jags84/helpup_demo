class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :albums
  validates :email
  
  private
    def user_params
      params.require(:user).permit(:email,:password,:password_confirmation,:name,:last_names,:avatar)
    end
end
