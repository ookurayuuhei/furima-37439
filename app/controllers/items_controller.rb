class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit, :update ]
  before_action :set_item, only: [:show, :edit]
  
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
    @item = Item.find(params[:id])
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

  def move_to_index
    unless current_user.id == item.user.id
      redirect_to root_path
    end
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
