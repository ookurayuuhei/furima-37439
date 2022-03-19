class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  
  
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
     render :new
    end
  end
  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end

  def move_to_index
    @item = Item.find(params[:id])
    redirect_to root_path if current_user.id != @item.user_id || @item.purchase != nil
  end

  def set_item
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:items_name, :explanation, :category_id,
    :status_id, :delivery_fee_id, :shipping_area_id, :shipping_days_id,
    :price, :image).merge(user_id: current_user.id)
    end
end
