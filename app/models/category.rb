class Category < ApplicationRecord
    validates_presence_of :name, on: :create, message: "can't be blank m"
    
    has_many :restaurants, dependent: :destroy
end
