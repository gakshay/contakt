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
  has_many :configurations
  has_many :services, :through => :configurations
  
  after_create :enable_default_configurations
  
  
  def enable_default_configurations
    services = Service.select("id")
    services.each do |service|
      Configuration.create(service_id: service.id, user_id: self.id)
    end
  end
  
end
