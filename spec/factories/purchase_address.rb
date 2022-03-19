FactoryBot.define do
  factory :purchase_address do
    post_number          { '123-4567' }
    shipping_area_id        { '2' }
    city                 { '東京都' }
    address              { '1-1' }
    build                { 'aaaa' }
    phone_number         { '08012345678' }
    token                { 'tok_abcdefghijk00000000000000000' }
  end
end
