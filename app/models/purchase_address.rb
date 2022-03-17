class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_number, :shipping_area_id, :city, :address, :build, :phone_number, :purchase_id, :user_id, :item_id
  end