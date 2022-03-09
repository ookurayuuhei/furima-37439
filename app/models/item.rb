class Item < ApplicationRecord

  PRICE_REGEX = /\A[0-9]+\z/.freeze
  validates_format_of [:price], with: PRICE_REGEX, message: 'は半角数字のみ使用できます'

  validates :items_name,        presence: true
  validates :explanation,       presence: true
  validates :category_id,       presence: true
  validates :status_id,         presence: true
  validates :delivery_fee_id,   presence: true
  validates :shipping_area_id,  presence: true
  validates :shipping_days_id,  presence: true
  validates :price,             presence: true
  validates :image,             presence: true

  belongs_to :user
  has_one_attached :image
end
