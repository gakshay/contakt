class AddressesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show, :thank_you]
  before_filter :find_user_addresses, :only => [:index, :show, :thank_you]
  
  # GET /addresses
  # GET /addresses.json
  def index
    @form = Form.new(params[:form]) 
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @addresses }
    end
  end

  # GET /addresses/1
  # GET /addresses/1.json
  def show
    id = params[:id].to_i - 1
    if (id < 0) or (id > @addresses.length)
      respond_to do |format|
        format.html { redirect_to "/#{@user.name}", alert: 'Address was not found.'}
        format.json { render json: @address }
      end
    else
      @address = @addresses[id]
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @address }
      end
    end
    
  end

  # GET /addresses/new
  # GET /addresses/new.json
  def new
    @address = current_user.addresses.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @address }
    end
  end

  # GET /addresses/1/edit
  def edit
    @address = current_user.addresses.find(params[:id])
  end

  # POST /addresses
  # POST /addresses.json
  def create
    @address = current_user.addresses.new(params[:address])
    @count = current_user.addresses.count
    respond_to do |format|
      if @address.save
        format.html { redirect_to "/#{current_user.name}/address/#{@count + 1}", notice: 'Address was successfully created.' }
        format.json { render json: @address, status: :created, location: @address }
      else
        format.html { render action: "new" }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /addresses/1
  # PUT /addresses/1.json
  def update
    @address = current_user.addresses.find(params[:id])
    respond_to do |format|
      if @address.update_attributes(params[:address])
        #format.html { redirect_to @address, notice: 'Address was successfully updated.' }
        format.json { head :no_content }
      else
        #format.html { render action: "edit" }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    @address = current_user.addresses.find(params[:id])
    @address.destroy

    respond_to do |format|
      format.html { redirect_to addresses_url }
      format.json { head :no_content }
    end
  end
  
  
  # POST /thank_you
  def thank_you
    @form = Form.new(params[:form])
    respond_to do |format|
      if @form.save
        format.html { redirect_to("/#{@user.name}", :notice => 'Thanks for contacting us.') }
      else
        params[:name] = @user.name
        format.html { render action: "index"}
      end
    end
  end
  
  def subregion_options
    render partial: 'subregion_select'
  end
  
  
  
  private
  
  def find_user_addresses
    unless params[:name].blank?
      @user = User.find_by_name(params[:name])
      @addresses = @user.addresses unless @user.blank?
      if @user.blank?
        respond_to do |format|
          format.html { redirect_to root_url }# index.html.erb
          format.json { head :no_content }
        end
      end
    end
  end
  
end
