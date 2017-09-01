require 'rails_helper'

RSpec.describe 'Restaurants info api', type: :request do
	
	let!(:restaurants) { create_list(:restaurant, 1) }
	let(:restaurant_id) { restaurants.first.id }

	describe 'GET /restaurants' do
		
		before { get '/restaurants' }

		it 'returns restaurants' do
			
			expect(json).not_to_be_empty
			expect(json.size).to eq(1)

		end

		it 'returns status code 200' do
			expect(response).to have_http_status(200)
		end

	end

	describe 'POST /restaurants' do
		let(:valid_attributes) { { 
			id: 'c29082c4-4352-4517-9b4b-c45f86fd1930', 
			rating: 4, 
			name: 'La casa de Toño', 
			site: 'https://lacasa.com', 
			email: 'lacasa@gmail.com', 
			phone: '5532-129-406', 
			street: '450 Viaducto', 
			city: 'Doctores',
			state: 'CDMX', 
			lat: 19.433497663015,
			lng: -99.1285135065721, 
		 } }

		 context 'when the request is valid' do
		 	
		 	before { post '/restaurants', params: valid_attributes }

		 	it 'creates a restaurant' do
		 		expect(json['id']).to eq('c29082c4-4352-4517-9b4b-c45f86fd1930')
		 	end

		 	it 'returns status code 201' do
		 		expect(response).to have_http_status(201)
		 	end

		 end

		 context 'when the request is invalid' do
		 		before { post '/restaurants', params: { id: 'xxx' } }

		 		it 'returns status code 422' do
		 			expect(response).to have_http_status(422)
		 		end

		 end

	end

	describe 'PUT /restaurants/:id' do
		let(:valid_attributes) { { 
			rating: 3, 
			name: 'La casa de Toño', 
			site: 'https://lacasadetonio.com', 
			email: 'lacasadetonio@gmail.com', 
			phone: '5532-129-406', 
			street: '450 Viaducto', 
			city: 'Doctores',
			state: 'CDMX', 
			lat: 19.433497663015,
			lng: -99.1285135065721, 
		 } }

		 context 'when the record exists' do
      before { put "/restaurants/#{restaurant_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

    end

	end

	describe 'DELETE /restaurants/:id' do

    before { delete "/restaurants/#{restaurant_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end

  end

end