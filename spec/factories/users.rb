FactoryBot.define do
  factory :user do
    nickname               {Faker::Name.name}
    email                  {Faker::Internet.free_email}
    password                { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation  {password}
    first_name             {'漢字'}
    last_name              {'ひらがな'}
    first_name_kana         {'カタカナ'}
    last_name_kana        {'カタカナ'}
    birthday               {'1999-01-01'}
  end
end