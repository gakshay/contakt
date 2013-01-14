class Configuration < ActiveRecord::Base
  attr_accessible :service_id, :user_id, :status
  belongs_to :service
  belongs_to :user
end
