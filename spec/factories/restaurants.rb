FactoryGirl.define do
	factory :restaurant do
		id { Faker::Code.isbn }
		rating { rand(0..4) }
		name { Faker::Company.name }
		site { Faker::Internet.url }
		email { Faker::Internet.email }
		phone { Faker::PhoneNumber.phone_number }
		street { Faker::Address.street_address }
		city { Faker::Address.city }
		state { Faker::Address.state }
		lat { Faker::Address.latitude }
		lng { Faker::Address.longitude }
	end
end