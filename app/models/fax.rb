class Fax < ActiveRecord::Base
  attr_accessible :address_id, :label, :number
  validates_format_of :number, with: /^\d{10,15}$/i, allow_blank: true
  
  belongs_to :address
end
