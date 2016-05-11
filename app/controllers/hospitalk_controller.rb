class HospitalkController < ApplicationController
  before_action :move_to_index, except: :index
  def index
    @hospis = Hospi.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end
  def new
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
