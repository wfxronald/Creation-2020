# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create!(name: "Example Admin",
                    nusnet: "A0189174R",
             faculty: "School Of Computing",
             year: "Year 1",
             contact_number: "84265038",
             admin: true,
             email: "admin@u.nus.edu",
             password: "password",
             password_confirmation: "password")

challenge = user.challenge_statements.create!(title: "Challenge Statement 1", partner_name: "NUSSU Welfare", description: Faker::Lorem.paragraph(2))
challenge.zip.attach(io: File.open('app/assets/seed/ui-screenshot.jpg'), filename: 'ui-screenshot.jpg')
challenge = user.challenge_statements.create!(title: "Challenge Statement 2", partner_name: "NUS IT", description: Faker::Lorem.paragraph(4))
challenge.zip.attach(io: File.open('app/assets/seed/ui-screenshot.jpg'), filename: 'ui-screenshot.jpg')

User.create!(name: "Example Student",
             nusnet: "A0189174B",
             faculty: "School Of Business",
             year: "Year 4",
             contact_number: "84265038",
             email: "examplestudent@u.nus.edu",
             password: "password",
             password_confirmation: "password")

#(1..10).each do |n|
#  name = Faker::Name.unique.name
#  email = "#{name.gsub(/[^a-z0-9]/i, '')}#{n}@u.nus.edu"
#User.create!(name: name,
#            matrix_number: "A0189174R",
#            faculty: "School Of Computing",
#            year: "Year 1",
#            contact_number: "84265038",
#            email: email,
#            password: "password",
#            password_confirmation: "password")
#
#end