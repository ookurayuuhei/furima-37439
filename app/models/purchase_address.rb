class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_number, :shipping_area_id, :city, :address, :build, :phone_number, :purchase_id, :user_id, :item_id, :token
  with_options presence: true do
    validates :post_number, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city
    validates :address
    validates :phone_number, numericality: { only_integer: true }, length: { in: 1..11 }
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank"}

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_number: post_number, shipping_area_id: shipping_area_id, city: city, address: address, build: build, phone_number: phone_number, purchase_id: purchase.id)
  end

end