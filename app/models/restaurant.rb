class Restaurant < ApplicationRecord
    #validates_presence_of :name, on: :create, message: "can't be blank"    
    validates_presence_of :name
    mount_uploader :image, PhotoUploader
    belongs_to :category, optional: true
    has_many :comments, dependent: :destroy

    has_many :favorites, dependent: :destroy
    has_many :favorited_users, through: :favorites, source: :user

    def is_favorited?(user)
        self.favorited_users.include?(user)
    end
end
