class HospitalkController < ApplicationController
  before_action :move_to_index, except: :index
  def index
    @hospis = Hospi.includes(:user).order("created_at DESC").page(params[:page]).per(5)
    @users = Usermap.all
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow user.description
      marker.json({title: user.title})
    end
  end
  def new
  end

  def picture_params
      params.require(:hospi).permit(:avatar)
  end


  def show
    @hospi = Hospi.find(params[:id])
    # @user = User.find{id==@hospi.user_id}
    # binding.pry
    # use google map api in here
    # define instance( instance is @~~~~~ )
    # create view file( show.html.erb )
    # write layout in show.html.erb

    # google api is down code

    # @users = Usermap.all
     # @hash = Gmaps4rails.build_markers(@hospi) do |hospi, marker|
     #  location = Geocoder.search( hospi.address )
     #   marker.lat location[0].latitude
     #   marker.lng location[0].longitude
     #   marker.infowindow hospi.contents
     #   marker.json({title: hospi.remarkhospital})
     # end

     @hash = Gmaps4rails.build_markers(@hospi) do |hospi, marker|
      location = Geocoder.search( hospi.address )
      marker.lat location[0].latitude
      marker.lng location[0].longitude
    end

  end

  def search
    # 検索フォームのキーワードをあいまい検索して、productsテーブルから20件の作品情報を取得する
    @hospis = Hospi.where('remarkhospital LIKE(?)', "%#{params[:keyword]}%").limit(20)
  end


  def create
    # Hospi.create(hospitalk_params)
    Hospi.create(remarkhospital: hospitalk_params[:remarkhospital],point: hospitalk_params[:point],contents: hospitalk_params[:contents],address: hospitalk_params[:address],user_id: current_user.id)
  end
  def destroy
    hospi = Hospi.find(params[:id])
    if hospi.user_id == current_user.id
      hospi.destroy
    end
  end
  def edit
    @hospi = Hospi.find(params[:id])
  end
  def update
    hospi = Hospi.find(params[:id])
    if hospi.user_id == current_user.id
      hospi.update(hospitalk_params)
    end
  end
  private
  def hospitalk_params
    # params.permit(remarkuser: params[:remarkuser], remarkhospital: params[:remarkhospital], point: params[:point], contents: params[:contents], address: params[:address])
    params.permit(:remarkhospital, :point, :contents, :address)
  end
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
