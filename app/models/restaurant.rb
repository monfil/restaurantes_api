class Restaurant < ApplicationRecord

	self.primary_key = 'id'
	validates :rating, :inclusion => { :in => 0..4 }
	
end
