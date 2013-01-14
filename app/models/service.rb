class Service < ActiveRecord::Base
  has_many :configurations
  has_many :users, :through => :configurations
end
