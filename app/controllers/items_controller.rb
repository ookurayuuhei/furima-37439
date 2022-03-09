class ItemsController < ApplicationController
  def index
  end

  private

  def item_params
    params.require(:item).permit(:items_name, :explanation, :category_id,
    :status_id, :delivery_fee_id, :shipping_area_id, :shipping_days_id,
    :price, :image).merge(user_id: current_user.id)
    end
end
