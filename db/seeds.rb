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
UserFollower.destroy_all


# Making Template Users for us to login with
admin = User.create(name: "admin", handle: "ADMIN", password: "1234")
admin2 = User.create(name: "admin2", handle: "ADMIN2", password: "password")

# Followers for template users
UserFollower.create(user_id: admin)
UserFollower.create(user_id: admin)
UserFollower.create(user_id: admin2)
UserFollower.create(user_id: admin2)

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

# everyone gets two followers
uid0 = User.first.id
uidn = User.last.id

for u in uid0..uidn do
    count = rand(4)
    for i in 1..count do
        f = rand(r) + u0.id
        while f == u do
            f = rand(r) + u0.id
        end
        uf = UserFollower.create!(user_id: u, followerId: f)
    end
end
