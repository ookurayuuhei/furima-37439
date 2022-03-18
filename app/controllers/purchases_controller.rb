class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index
  before_action :set_item

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:post_number, :shipping_area_id, :city, :address, :build, :phone_number).merge(user_id: current_user.id, 
    item_id: params[:item_id], token: params[:token])
  end

  def move_to_index
    item = Item.find(params[:item_id])
    if user_signed_in? && current_user.id == item.user.id
      redirect_to root_path
    end
  end
end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: @purchase_address.token,
        currency: 'jpy'
      )
end
