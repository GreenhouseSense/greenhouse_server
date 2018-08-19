5.times do
	Decision.create({
		description: Faker::Lorem.sentence,
		origin: Faker::Name.first_name
	})
end