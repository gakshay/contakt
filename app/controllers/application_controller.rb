class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :layout

  private

  def layout
      # only turn it off for login and registration pages:
    if is_a?(Devise::RegistrationsController) or is_a?(Devise::SessionsController)
      "plain"
    else
      "application"  
    end
  end
  
  
end
