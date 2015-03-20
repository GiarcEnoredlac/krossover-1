Fabricator(:user) do 
	first_name { Faker::Name.name }
	last_name { Faker::Name.name }
	username { Faker::Internet.user_name }
  email { Faker::Internet.email }
  password 'password'
end