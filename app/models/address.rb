require 'net/http'

class Address < ActiveRecord::Base
  attr_accessible :city, :country, :state, :street_address, :street_address_two, :zipcode, :latitude, :longitude
  validates_presence_of :city, :country, :state, :street_address, :zipcode
  
  before_create :find_lat_long
  
  belongs_to :user
  has_many :phones
  has_many :faxes
  has_many :emails
  
  GMAPS_URL = "http://maps.googleapis.com/maps/api/geocode/json?sensor=true&address="
    
  
  def find_lat_long
    coordinates = Geocoder.coordinates(address)
    unless coordinates.blank?
      self.latitude, self.longitude = coordinates[0], coordinates[1]
    end
  end
  
  def address
    [self.street_address, self.street_address_two, self.city, self.state, self.country].compact.join(', ')
  end
  
  private
  
  def encoded_address
    URI.encode address
  end
  
  
  
end
