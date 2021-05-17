FactoryBot.define do
  factory :user do
    nickname              {'test'}
    first_name            {'ごとう'}
    last_name             {'ゆうた'}
    first_name_kana       {'ゴトウ'}
    last_name_kana        {'ユウタ'}
    email                 {Faker::Internet.free_email}
    birth_day             {'1987-06-03'}
    password = '1a' + Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
  end
end