class Restaurant < ApplicationRecord

	self.primary_key = 'id'
	validates :rating, :inclusion => { :in => 0..4 }

	after_create do
		self.update_coord
  end

  after_update do
  	self.update_coord
  end

  def update_coord
  	ActiveRecord::Base.connection.execute ("UPDATE restaurants SET coord = ST_SetSRID(ST_Point(lng, lat),4326)")
  end

  def self.nearby_restaurants(latitude, longitude, distance)
  	where("ST_DWithin(ST_GeographyFromText('SRID=4326;POINT(:lon :lat)'), restaurants.coord, :distance)", 
			lon: longitude, lat: latitude,distance: distance)
  end
	
end
