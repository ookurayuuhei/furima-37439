FactoryBot.define do
  factory :item do
    items_name              {Faker::Name.name}
    explanation             {'text'}
    category_id             {'2'}
    status_id               {'2'}
    delivery_fee_id         {'2'}
    shipping_area_id        {'2'}
    shipping_days_id        {'2'}
    price                   {'1000'}
    
  end
end