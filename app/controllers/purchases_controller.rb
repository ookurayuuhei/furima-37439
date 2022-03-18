class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index

  def index
    @item = Item.find(params[:item_id])
    @purchase__address = PurchaseAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:post_number, :shipping_area_id, :city, :address, :build, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def move_to_index
    item = Item.find(params[:item_id])
    if user_signed_in? && current_user.id == item.user.id
      redirect_to root_path
    end
  end
end
