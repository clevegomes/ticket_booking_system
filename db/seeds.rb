# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

# Create 5 users
users = User.create!([
                       { email: 'u1@example.com', password: 'password', password_confirmation: 'password' },
                       { email: 'u2@example.com', password: 'password', password_confirmation: 'password' },
                       { email: 'u3@example.com', password: 'password', password_confirmation: 'password' },
                       { email: 'u4@example.com', password: 'password', password_confirmation: 'password' },
                       { email: 'u5@example.com', password: 'password', password_confirmation: 'password' }
                     ])

# Create 20 events
users.each do |user|
  4.times do |i|
    Event.create!(
      name: "Event #{i + 1} by #{user.email}",
      description: "Description for Event #{i + 1}",
      location: "Location #{i + 1}",
      date: DateTime.now + (i + 1).days,
      total_tickets: rand(50..100),
      user: user
    )
  end
end

puts "Seeded 5 users and 20 events."
