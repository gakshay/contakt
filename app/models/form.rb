class Form < ActiveRecord::Base
  attr_accessible :company, :email, :message, :mobile, :name, :user_id
  
  validates_presence_of :name, :email, :message
  validates :email, allow_blank: true, format: {with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i}
  
end
