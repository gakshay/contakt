class Email < ActiveRecord::Base
  attr_accessible :address_id, :email, :label
  validates_format_of :email, with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  
  belongs_to :address
end
