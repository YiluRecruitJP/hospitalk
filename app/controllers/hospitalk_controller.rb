class HospitalkController < ApplicationController
  before_action :move_to_index, except: :index
  def index
    @hospis = Hospi.order("created_at DESC").page(params[:page]).per(5)
  end
  def new
  end

  def create
    Hospi.create(hospitalk_params)
  end
  private
  def hospitalk_params
    # params.permit(remarkuser: params[:remarkuser], remarkhospital: params[:remarkhospital], point: params[:point], contents: params[:contents], address: params[:address])
    params.permit( :remarkuser, :remarkhospital, :point, :contents, :address)
  end
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
