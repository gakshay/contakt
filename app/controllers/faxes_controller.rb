class FaxesController < ApplicationController
  # GET /faxes
  # GET /faxes.json
  def index
    @faxes = Fax.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @faxes }
    end
  end

  # GET /faxes/1
  # GET /faxes/1.json
  def show
    @faxis = Fax.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @faxis }
    end
  end

  # GET /faxes/new
  # GET /faxes/new.json
  def new
    @faxis = Fax.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @faxis }
    end
  end

  # GET /faxes/1/edit
  def edit
    @faxis = Fax.find(params[:id])
  end

  # POST /faxes
  # POST /faxes.json
  def create
    @faxis = Fax.new(params[:faxis])

    respond_to do |format|
      if @faxis.save
        format.html { redirect_to @faxis, notice: 'Fax was successfully created.' }
        format.json { render json: @faxis, status: :created, location: @faxis }
      else
        format.html { render action: "new" }
        format.json { render json: @faxis.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /faxes/1
  # PUT /faxes/1.json
  def update
    @faxis = Fax.find(params[:id])

    respond_to do |format|
      if @faxis.update_attributes(params[:faxis])
        format.html { redirect_to @faxis, notice: 'Fax was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @faxis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faxes/1
  # DELETE /faxes/1.json
  def destroy
    @faxis = Fax.find(params[:id])
    @faxis.destroy

    respond_to do |format|
      format.html { redirect_to faxes_url }
      format.json { head :no_content }
    end
  end
end
