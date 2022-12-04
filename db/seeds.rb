# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
User.destroy_all
Post.destroy_all

User.create!([
    {
        name: Faker::Name.name, handle: Faker::Name.initials, password: Faker::Alphanumeric.alphanumeric(number: 10)
    },
    {
        name: Faker::Name.name, handle: Faker::Name.initials, password: Faker::Alphanumeric.alphanumeric(number: 10)
    },
    {
        name: Faker::Name.name, handle: Faker::Name.initials, password: Faker::Alphanumeric.alphanumeric(number: 10)
    },
    {
        name: Faker::Name.name, handle: Faker::Name.initials, password: Faker::Alphanumeric.alphanumeric(number: 10)
    },
    {
        name: Faker::Name.name, handle: Faker::Name.initials, password: Faker::Alphanumeric.alphanumeric(number: 10)
    },
    {
        name: Faker::Name.name, handle: Faker::Name.initials, password: Faker::Alphanumeric.alphanumeric(number: 10)
    },
    {
        name: Faker::Name.name, handle: Faker::Name.initials, password: Faker::Alphanumeric.alphanumeric(number: 10)
    },
    {
        name: Faker::Name.name, handle: Faker::Name.initials, password: Faker::Alphanumeric.alphanumeric(number: 10)
    },
    {
        name: Faker::Name.name, handle: Faker::Name.initials, password: Faker::Alphanumeric.alphanumeric(number: 10)
    },
    {
        name: Faker::Name.name, handle: Faker::Name.initials, password: Faker::Alphanumeric.alphanumeric(number: 10)
    },
    {
        name: Faker::Name.name, handle: Faker::Name.initials, password: Faker::Alphanumeric.alphanumeric(number: 10)
    },
    {
        name: Faker::Name.name, handle: Faker::Name.initials, password: Faker::Alphanumeric.alphanumeric(number: 10)
    }
])

u0=User.first
un=User.last
r=un.id-u0.id

for a in 1..30 do
    n = rand(r) + u0.id
    p = Post.create!(user: User.find_by(id: n), parentPostId: 0, rootPostId: 0, commentPermissions: rand(3), text: Faker::Company.catch_phrase)
    if rand(2) > 0
        n = rand(r) + u0.id
        Post.create!(user: User.find_by(id: n), parentPostId: p.id, rootPostId: p.id, commentPermissions: rand(3), text: Faker::Company.catch_phrase)
    end
end