Fabricator(:review) do 
	title { Faker::Name.name }
	user_id {1}
end