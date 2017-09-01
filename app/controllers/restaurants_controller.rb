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
		p "INSIDE STATISTICS"

		p params
		p params[:latitude]
		p params[:longitud]
		# @restaurants = Restaurant.where(lat: params[:lat])

		@restaurants = Restaurant.find(:all, :origin => [params[:latitude], params[:longitud]], :within => params[:radius])
	end

	private

	def restaurant_params
		params.permit(:id, :rating, :name, :site, :email, :phone, :street, :city, :state, :lat, :lng)
	end

	def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end