class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :delivery_fee
  belongs_to :category
  belongs_to :shipping_area
  belongs_to :shipping_days
  belongs_to :status
  has_one_attached :image


  PRICE_REGEX = /\A[0-9]+\z/.freeze
  validates_format_of [:price], with: PRICE_REGEX, message: 'は半角数字のみ使用できます'

  with_options presence: true do
  validates :items_name
  validates :explanation
  validates :image
  validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9999999} 
  end

  with_options numericality: { other_than: 1 , message: "can't be blank" } do
  validates :category_id
  validates :status_id
  validates :delivery_fee_id
  validates :shipping_area_id
  validates :shipping_days_id
  end
end