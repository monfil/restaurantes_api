class RestaurantsController < ApplicationController

	before_action :set_restaurant, only: [:update, :destroy]

	def index
		@restaurants = Restaurant.all
    json_response(@restaurants)
	end

	def create
		@restaurant = Restaurant.create!(restaurant_params)
    json_response(@restaurant, :created)
	end

	def update
		@restaurant.update(restaurant_params)
		head :no_content
	end

	def destroy
		@restaurant.destroy
		head :no_content
	end

	def show
		lat = params[:latitude].to_f
		lon = params[:longitud].to_f
		rad = params[:radius].to_i

		@nearby_restaurants = Restaurant.nearby_restaurants(lat, lon, rad)

		rating_array = []

		@nearby_restaurants.each do |restaurant|
			rating_array << restaurant.rating
		end

		@array_response = {
			"count" => @nearby_restaurants.count, 
			"avg" => rating_array.average, 
			"std" => rating_array.standard_deviation
		}

		json_response(@array_response, :created)
		
	end

	private

	def restaurant_params
		params.permit(:id, :rating, :name, :site, :email, :phone, :street, :city, :state, :lat, :lng)
	end

	def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end

module Enumerable

    def sum
      self.inject(0){|accum, i| accum + i }
    end

    def average
      self.sum/self.length.to_f
    end

    def sample_variance
      m = self.average
      sum = self.inject(0){|accum, i| accum +(i-m)**2 }
      sum/(self.length - 1).to_f
    end

    def standard_deviation
      return Math.sqrt(self.sample_variance)
    end

end 