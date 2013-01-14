class ConfigurationsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /configuration/1/edit
  def edit
    @configuration = current_user.configurations.find(params[:id])
  end
  
  # PUT /addresses/1
  # PUT /addresses/1.json
  def update
    @configuration = current_user.configurations.find(params[:id])
    respond_to do |format|
      if @configuration.update_attributes(params[:configuration])
        format.html { redirect_to root_url, notice: 'Configuration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @configuration.errors, status: :unprocessable_entity }
      end
    end
  end

end