class Service < ActiveRecord::Base
  attr_accessible :name, :label
  has_many :configurations
  has_many :users, :through => :configurations
end
