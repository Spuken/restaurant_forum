namespace :dev do
    task fake: :environment do
        fake_category
        fake_user
        fake_restaurant
        fake_comment
    end   
    
    def fake_restaurant
        Restaurant.destroy_all

        50.times do |i|
            Restaurant.create!(name: FFaker::Name.first_name,
                opening_hours: FFaker::Time.datetime,
                tel: FFaker::PhoneNumber.short_phone_number,
                address: FFaker::Address.street_address,
                description: FFaker::Lorem.paragraph,
                category: Category.all.sample,
                #category_id: Category.all.sample.id (跟上面那行一樣意思)        
                image: Pathname.new(Rails.root.join("app/assets/images/default.png")).open
                )                
        end

        puts "have created fake restaurants"
        puts "now you have #{Restaurant.count} restaurants data"        
    end

    def fake_category
        Category.destroy_all

        category_list = [
            { name: "中式料理" },
            { name: "日本料理" },
            { name: "義大利料理" },
            { name: "墨西哥料理" },
            { name: "素食料理" },
            { name: "美式料理" },
            { name: "複合式料理" }
        ]

        category_list.each do |category|
            Category.create(name: category[:name])
        end

        puts "Category seeds created!"
        
    end    

    def fake_user
        User.destroy_all

        User.create(email: "root@root.com", password: "123456", role: "admin", name: "Spuken")
        User.create(email: "aaa@aaa.com", password: "123456", name: "aaa")

        puts "Default admin user created!"

        18.times do |i|
            User.create(email: FFaker::Internet.email, password: "123456", name: FFaker::Name.first_name )
        end

        path = File.join(Rails.root, "app", "assets", "images", "default_avatar.png")

        User.all.each do |u|
            u.avatar = Pathname.new(path).open
            u.save!
        end

        puts "User seeds created!"
    end
    
    def fake_comment
        Comment.destroy_all

        Restaurant.all.each do |res|
            3.times do |i|
                offset = rand(User.count)
                com = res.comments.build(
                    content: FFaker::Lorem.paragraph,
                    user_id: User.offset(offset).first.id
                )
                com.save!
            end
            #puts "Restaurant each" + res.id.to_s
        end

        puts "Comment seeds created!"
    end
    

end