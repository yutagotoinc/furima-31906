FactoryBot.define do
  factory :product do
    name                  {'test'}
    description           {Faker::Lorem.sentence}
    category_id           {2}
    status_id             {2}
    charge_id             {2}
    area_id               {2}
    duration_id           {2}
    price                 {300}
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end

  end
end
