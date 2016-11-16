# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Restaurant.destroy_all

5.times do
  resto = Restaurant.new(
    name:         Faker::Company.name,
    address:      Faker::Address.street_name + " " + Faker::Address.city,
    phone_number:  Faker::PhoneNumber.phone_number,
    category:      ["chinese", "italian", "japanese", "french", "belgian"].sample
  )
  resto.save
  3.times do
    review = Review.new(
      content: Faker::Hipster.paragraph,
      rating: (0..5).to_a.sample,
      restaurant: resto
    )
    review.save
  end
end
