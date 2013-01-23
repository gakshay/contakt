require 'net/http'

class Address < ActiveRecord::Base
  attr_accessible :city, :country, :state, :street_address, :street_address_two, :zipcode, :latitude, :longitude
  attr_accessible :phones_attributes, :faxs_attributes, :emails_attributes, :label
  validates_presence_of :city, :country, :state, :street_address, :zipcode, :label
  
  belongs_to :user
  has_many :phones, :dependent => :destroy
  has_many :faxs, :dependent => :destroy
  has_many :emails, :dependent => :destroy
  accepts_nested_attributes_for :phones, :allow_destroy => true, :reject_if => lambda { |a| a[:number].blank? }
  accepts_nested_attributes_for :faxs, :allow_destroy => true, :reject_if => lambda { |a| a[:number].blank? }
  accepts_nested_attributes_for :emails, :allow_destroy => true, :reject_if => lambda { |a| a[:email].blank? }
  
  before_create :find_lat_long
  
  
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
