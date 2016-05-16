class UsermapsController < ApplicationController
  before_action :set_usermap, only: [:show, :edit, :update, :destroy]

  # GET /usermaps
  # GET /usermaps.json
  def index

    
  end

  # GET /usermaps/1
  # GET /usermaps/1.json
  def show
  end

  # GET /usermaps/new
  def new
    @usermap = Usermap.new
  end

  # GET /usermaps/1/edit
  def edit
  end

  # POST /usermaps
  # POST /usermaps.json
  def create
    @usermap = Usermap.new(usermap_params)

    respond_to do |format|
      if @usermap.save
        format.html { redirect_to @usermap, notice: 'Usermap was successfully created.' }
        format.json { render :show, status: :created, location: @usermap }
      else
        format.html { render :new }
        format.json { render json: @usermap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usermaps/1
  # PATCH/PUT /usermaps/1.json
  def update
    respond_to do |format|
      if @usermap.update(usermap_params)
        format.html { redirect_to @usermap, notice: 'Usermap was successfully updated.' }
        format.json { render :show, status: :ok, location: @usermap }
      else
        format.html { render :edit }
        format.json { render json: @usermap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usermaps/1
  # DELETE /usermaps/1.json
  def destroy
    @usermap.destroy
    respond_to do |format|
      format.html { redirect_to usermaps_url, notice: 'Usermap was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usermap
      @usermap = Usermap.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usermap_params
      params.require(:usermap).permit(:title, :description, :address, :latitude, :longitude)
    end
end
