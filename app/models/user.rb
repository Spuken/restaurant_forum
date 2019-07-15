class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, AvatarUploader
  has_many :comments, dependent: :destroy
  has_many :restaurants, through: :comments

  has_many :favorites, dependent: :destroy
  has_many :favorited_restaurants, through: :favorites, source: :restaurant

  has_many :followships, dependent: :destroy # class_name: "followship", foreign_key: "user_id"
  has_many :followings, through: :followships # source: :following

  def admin?
    self.role == "admin"    
  end
         
end
