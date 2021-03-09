# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "cleaning up database"
Flat.destroy_all
puts 'database is clean'

puts 'Creating Flats'
10.times do 
    flat = Flat.create(
        price: rand(100..500),
        description: Faker::TvShows::SiliconValley.motto,
        address: Faker::Address.street_address,
        availability_start_date: Faker::Date.backward(days: 150) ,
        availability_end_date: Faker::Date.forward(days: 100) ,
        title: Faker::TvShows::SiliconValley.app
    )
    puts "flat #{flat.id} is created"
end 
puts "done" 

# t.integer "price"
# t.text "description"
# t.text "address"
# t.date "availability_start_date"
# t.date "availability_end_date"
# t.string "title"
# t.bigint "user_id"
# t.datetime "created_at", precision: 6, null: false
# t.datetime "updated_at", precision: 6, null: false
# t.index ["user_id"], name: "index_flats_on_user_id"