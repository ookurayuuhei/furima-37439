FactoryBot.define do
  factory :user do
    nickname               {Faker::Name.initials}
    email                  {Faker::Internet.free_email}
    password               = Faker::Internet.password(min_length: 6)
    password               {password}
    password_confirmation  {password}
    first_name             {'漢字'}
    last_name              {'ひらがな'}
    last_name_kana         {'カタカナ'}
    first_name_kana        {'カタカナ'}
    birthday               {19990101}
  end
end