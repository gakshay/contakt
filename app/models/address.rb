class Address < ActiveRecord::Base
  attr_accessible :city, :country, :state, :street_address, :street_address_two, :zipcode, :latitude, :longitude
end
