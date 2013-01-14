class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :token_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :company_name, :company_url, :name
  # attr_accessible :title, :body
  
  validates_presence_of :company_name, :company_url, :name
  validates_format_of :company_url, :with => URI::regexp(%w(http https))
  validates_format_of :name, :with => /^[a-zA-Z0-9]+$/, :message => "should be alphanumeric"
  
  has_many :addresses
  has_many :configurations, :dependent => :destroy
  has_many :services, :through => :configurations
  
  after_create :enable_default_configurations
  
  def contact_form
    self.services.where("name = ? and status = ?", "contact_form", true)
  end
  
  
  def enable_default_configurations
    services = Service.select("id")
    configurations = []
    services.each do |service|
       configurations << {service_id: service.id, user_id: self.id, status: true}
    end
    Configuration.create(configurations)
  end
  
  def reset_default_configurations
    self.configurations.clear
    enable_default_configurations
  end
  
end
