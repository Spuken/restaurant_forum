namespace :dev do
    task fake: :environment do
        Restaurant.destroy_all

        50.times do |i|
            Restaurant.create!(name: FFaker::Name.first_name,
                opening_hours: FFaker::Time.datetime,
                tel: FFaker::PhoneNumber.short_phone_number,
                address: FFaker::Address.street_address,
                description: FFaker::Lorem.paragraph,
                category: Category.all.sample,
                #category_id: Category.all.sample.id (跟上面那行一樣意思)        
                image: Pathname.new(Rails.root.join("public/uploads/restaurant/image/default/default.png")).open
                )                
        end

        puts "have created fake restaurants"
        puts "now you have #{Restaurant.count} restaurants data"
    end

    def create_fake_image        

        image = Magick::Image.new(240,90)
        image.background_color = '#23B852'
        image.erase!
        
        textc = 'Delicious'

        text = Magick::Draw.new
        text.pointsize = 48
        text.gravity = Magick::CenterGravity

        text.annotate(image,0,0,1,2, textc){
            self.fill = 'yellow'
        }

        return image
    end
    
end