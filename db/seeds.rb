# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Country.create(name: "USA")
Country.create(name: "India")
Country.create(name: "Philippines")

Admin.create(full_name: "Michael McDevitt", 
						 email: "mmcdevi1@gmail.com",
						 password: "password")

User.create(first_name: "Michael", 
						last_name: "McDevitt",
						username: "mmcdevi1",
						email: "mmcdevi1@gmail.com",
						password: "password",
						description: Faker::Lorem.paragraph(2),
						location: 1,
						videos_reviewed: 100 )

100.times do
	User.create(first_name: Faker::Name.first_name, 
							last_name: Faker::Name.last_name,
							username: Faker::Internet.domain_word,
							email: Faker::Internet.email,
							password: "password",
							description: Faker::Lorem.paragraph(2),
							location: rand(1..3),
							videos_reviewed: ( rand(1..500) ) 
							)
	end

1000.times do 
		Review.create(title: "Basketball Game",
								  user_id: rand(1..90),
								  game_length: rand(1..5),
								  review_length: rand(5..10),
								  number_of_plays: rand(50..70),
								  correct_plays: rand(30..50)
								  )
	end
