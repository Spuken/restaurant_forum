class Restaurant < ApplicationRecord
    #validates_presence_of :name, on: :create, message: "can't be blank"    
    validates_presence_of :name
    mount_uploader :image, PhotoUploader
end
