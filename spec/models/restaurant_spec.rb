require 'rails_helper'

RSpec.describe Restaurant, type: :model do

	it "Is valid with id" do
		restaurant = Restaurant.new(
			id: '9f98fad3-ecd6-421b-ba8c-2bd63340473d',
			rating: 2,
			name: 'Macías S.L.',
			site: 'http://miguel.com.mx',
			email: 'Jazmin_Santiago7@yahoo.com',
			phone: '508272671',
			street: '1736 Adela Urbanización',
			city: 'Puerto Vallarta Dorotea',
			state: 'Baja California Sur',
			lat: 19.4369257779145,
			lng: -99.1315607513514,
			)
	end
end