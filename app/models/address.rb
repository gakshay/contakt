require 'net/http'

class Address < ActiveRecord::Base
  attr_accessible :city, :country, :state, :street_address, :street_address_two, :zipcode, :latitude, :longitude
  belongs_to :user
  
  
  GMAPS_URL = "http://maps.googleapis.com/maps/api/geocode/json?sensor=true&address="
    
  before_create :find_lat_long
  
  def find_lat_long
    coordinates = Geocoder.coordinates(address)
    unless coordinates.blank?
      self.latitude, self.longitude = coordinates[0], coordinates[1]
    end
    
    # url = GMAPS_URL + encoded_address
    #     result = Net::HTTP.get(URI.parse(url))
    #     resp = JSON.parse(result)
    #     self.latitude = resp.first["geometry"]["location"]["lat"]
    #     self.longitude = resp.first["geometry"]["location"]["lng"]
  end
  
  def address
    [self.street_address, self.street_address_two, self.city, self.state, self.country].compact.join(', ')
  end
  
  private
  
  def encoded_address
    URI.encode address
  end
  
  
  
end
