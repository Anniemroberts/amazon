# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# 15.times do
#   Product.create(
#     :title   => Faker::TwinPeaks.character,
#     :description   => Faker::TwinPeaks.quote,
#     :price        => Faker::Number.decimal(2)
#   )
# end

6.times do
  Category.create(
    name: Faker::Lorem.words(1)
    # what to pass it!!!!
  )
end
