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

# creating some posts for admin 1 
Post.create(user_id: 1, text:"I absolutely love programming! It's such a creative and challenging field that allows me to solve problems and build things that make a difference in the world.")
Post.create(user_id: 1, text:"There's nothing quite like the feeling of finally solving a tough programming problem and seeing your code come to life. #programmingrocks")
Post.create(user_id: 1, text:"The beauty of programming is that there's always something new to learn and new ways to improve your skills. It's a never-ending journey of discovery and growth.")
Post.create(user_id: 1, text:"I'm so grateful to be a programmer because it allows me to be a part of the tech industry and contribute to some of the most exciting innovations of our time.")
Post.create(user_id: 1, text:"Programming isn't just a job for me, it's a passion. I love the feeling of being able to create something out of nothing and see it come to life.")

# for admin 2
Post.create(user_id: 2, text:"The moon is the Earth's only natural satellite. It orbits the Earth at an average distance of about 238,855 miles (384,400 kilometers), and has a diameter of about 2,159 miles (3,474 kilometers).")
Post.create(user_id: 2, text:"The moon's gravitational pull causes the oceans on Earth to have tides. The tides are caused by the differences in gravitational forces on different parts of the Earth due to the moon's position in its orbit. The moon's gravity also causes the length of a day on Earth to slowly increase over time.")


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

# for a in 1..30 do
#     n = rand(r) + u0.id
#     p = Post.create!(user: User.find_by(id: n), parentPostId: 0, rootPostId: 0, commentPermissions: rand(3), text: Faker::Company.catch_phrase)
#     if rand(2) > 0
#         n = rand(r) + u0.id
#         Post.create!(user: User.find_by(id: n), parentPostId: p.id, rootPostId: p.id, commentPermissions: rand(3), text: Faker::Company.catch_phrase)
#     end
# end

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
