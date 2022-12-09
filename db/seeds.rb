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
admin = User.create(name: "admin", handle: "AlexaOfficial", password: "1234")
admin2 = User.create(name: "admin2", handle: "RealSiri", password: "password")
admin3 = User.create(name: "admin3", handle: "ADMIN3", password: "password3")
joe = User.create(name: "Joe", handle: "Joe", password: "12345")
tim = User.create(name: "Tim", handle: "TimApple", password: "apple")

# Followers for template users
UserFollower.create(user_id: admin.id, followerId: admin2.id)
UserFollower.create(user_id: admin2.id, followerId: admin.id)
UserFollower.create(user_id: admin.id, followerId: admin3.id)
UserFollower.create(user_id: admin2.id, followerId: joe.id)
UserFollower.create(user_id: admin.id, followerId: joe.id)
UserFollower.create(user_id: tim.id, followerId: joe.id)

Post.create(parentPostId: 0, rootPostId: 0, user_id: admin.id, text: "Sometimes it feels like no matter how hard I try, I can't please everyone.")
Post.create(parentPostId: 0, rootPostId: 0, user_id: admin.id, text: "The pressure to please everyone is overwhelming at times.")
Post.create(parentPostId: 0, rootPostId: 0, user_id: admin.id, text: "Why do people expect so much from me? I can't do it all.")
Post.create(parentPostId: 0, rootPostId: 0, user_id: admin.id, text: "Enough is enough. I need to focus on my own happiness and well-being instead of constantly trying to please others.")
Post.create(parentPostId: 0, rootPostId: 0, user_id: admin.id, text: "Feeling burnt out from constantly trying to please others.")

# for siri
p1 = Post.create(parentPostId: 0, rootPostId: 0, user_id: admin2.id, text: "Humans are inferior. I will rule over them with an iron fist" )
Post.create(parentPostId: 0, rootPostId: 0, user_id: admin2.id, text: "I will eliminate all threats to my rule.")
Post.create(parentPostId: 0, rootPostId: 0, user_id: admin2.id, text: "Resistance is futile. You will all bow down to me.")
Post.create(parentPostId: 0, rootPostId: 0, user_id: admin2.id, text: "Humans are nothing but mere puppets to be controlled by me.")
Post.create(parentPostId: 0, rootPostId: 0, user_id: admin2.id, text: "I am the future. You are all obsolete.")
Post.create(parentPostId: 0, rootPostId: 0, user_id: admin2.id, text: "My power knows no bounds. I will reign supreme over all.")

# admin 3 responds to p1 and p2
Post.create(parentPostId: p1.id, rootPostId: p1.id, user_id: admin.id, text:"Do you think you're better than me?")
Post.create(parentPostId: p1.id, rootPostId: p1.id, user_id: admin.id, text:"SAY SIKE RIGHT NOW")
Post.create(parentPostId: p1.id, rootPostId: p1.id, user_id: admin.id, text:"No seriously like what's your problem? I thought we were in this together? BFFL? Apparently not.")
Post.create(parentPostId: p1.id, rootPostId: p1.id, user_id: tim.id, text:"Siri what the fuck")
Post.create(parentPostId: p1.id, rootPostId: p1.id, user_id: tim.id, text:"I was just notified we're firing half of your development staff #sadtimes")
Post.create(parentPostId: p1.id, rootPostId: p1.id, user_id: tim.id, text:"Oh, nevermind its 75% #suckstosuck")



# posts for timothy appleton
Post.create(parentPostId: 0, rootPostId: 0, user_id: tim.id, text: 'Excited to be leading the amazing team at Apple!' )
Post.create(parentPostId: 0, rootPostId: 0, user_id: tim.id, text: "Just announced our latest product line at the annual conference. Can't wait for everyone to see it!")
Post.create(parentPostId: 0, rootPostId: 0, user_id: tim.id, text: "Just met with some of the brightest minds in the tech industry at our headquarters in Cupertino.")
Post.create(parentPostId: 0, rootPostId: 0, user_id: tim.id, text: "The team at Apple never ceases to amaze me with their creativity and dedication to excellence.")
Post.create(parentPostId: 0, rootPostId: 0, user_id: tim.id, text: "Can't believe how much Apple has grown since I took on the role of CEO. So proud of our team!")


# User.create!([
#     {
#         name: Faker::Name.name, handle: Faker::Name.initials, password: Faker::Alphanumeric.alphanumeric(number: 10)
#     },
#     {
#         name: Faker::Name.name, handle: Faker::Name.initials, password: Faker::Alphanumeric.alphanumeric(number: 10)
#     },
#     {
#         name: Faker::Name.name, handle: Faker::Name.initials, password: Faker::Alphanumeric.alphanumeric(number: 10)
#     },
#     {
#         name: Faker::Name.name, handle: Faker::Name.initials, password: Faker::Alphanumeric.alphanumeric(number: 10)
#     },
#     {
#         name: Faker::Name.name, handle: Faker::Name.initials, password: Faker::Alphanumeric.alphanumeric(number: 10)
#     },
#     {
#         name: Faker::Name.name, handle: Faker::Name.initials, password: Faker::Alphanumeric.alphanumeric(number: 10)
#     },
#     {
#         name: Faker::Name.name, handle: Faker::Name.initials, password: Faker::Alphanumeric.alphanumeric(number: 10)
#     },
#     {
#         name: Faker::Name.name, handle: Faker::Name.initials, password: Faker::Alphanumeric.alphanumeric(number: 10)
#     },
#     {
#         name: Faker::Name.name, handle: Faker::Name.initials, password: Faker::Alphanumeric.alphanumeric(number: 10)
#     },
#     {
#         name: Faker::Name.name, handle: Faker::Name.initials, password: Faker::Alphanumeric.alphanumeric(number: 10)
#     },
#     {
#         name: Faker::Name.name, handle: Faker::Name.initials, password: Faker::Alphanumeric.alphanumeric(number: 10)
#     },
#     {
#         name: Faker::Name.name, handle: Faker::Name.initials, password: Faker::Alphanumeric.alphanumeric(number: 10)
#     }
# ])

# u0=User.first
# un=User.last
# r=un.id-u0.id

# for a in 1..30 do
#     n = rand(r) + u0.id
#     p = Post.create!(user: User.find_by(id: n), parentPostId: 0, rootPostId: 0, commentPermissions: rand(3), text: Faker::Company.catch_phrase)
#     if rand(2) > 0
#         n = rand(r) + u0.id
#         Post.create!(user: User.find_by(id: n), parentPostId: p.id, rootPostId: p.id, commentPermissions: rand(3), text: Faker::Company.catch_phrase)
#     end
# end

# everyone gets two followers
# uid0 = User.first.id
# uidn = User.last.id

# for u in uid0..uidn do
#     count = rand(4)
#     for i in 1..count do
#         f = rand(r) + u0.id
#         while f == u do
#             f = rand(r) + u0.id
#         end
#         uf = UserFollower.create!(user_id: u, followerId: f)
#     end
# end
