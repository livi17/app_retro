# Users
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated:    true,
             activated_at: Time.zone.now)
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated:    true,
               activated_at: Time.zone.now)  
end

# Events
users = User.order(:created_at).take(6)
50.times do 
  content = Faker::Lorem.paragraph(4, true, 4)
  title = Faker::Book.title
  single_day = 0
  start_date = "2013-09-23"
  end_date = "2013-09-23"
  address = Faker::Address.street_address
  latitude = Faker::Address.latitude
  longitude = Faker::Address.longitude
  users.each { |user| user.events.create!(
    content: content, 
    title: title, 
    address: address,
    latitude: latitude,
    longitude: longitude,
    single_day:  single_day,
    start_date: start_date, 
    end_date: end_date) }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }