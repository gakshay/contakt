class Form < ActiveRecord::Base
  attr_accessible :company, :email, :message, :mobile, :name, :user_id
end
