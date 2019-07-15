class Followship < ApplicationRecord
    belongs_to :user # class_name: "user", foreign_key: "user_id"
    belongs_to :following, class_name: "User" # foreign_key: "following_id"

    validates :following_id, uniqueness: {scope: :user_id}
    
end
