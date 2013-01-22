class HomeController < ApplicationController
  before_filter :authenticate_user!, :only => :show
  
  def index
    if user_signed_in?
      redirect_to "/#{current_user.name}"
    end      
  end
  
  def show
    @configurations = current_user.configurations
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: current_user }
    end
  end
  
end
