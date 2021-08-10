FactoryBot.define do
  factory :item do
    product_name       { 'test' }
    description        { Faker::Lorem.sentence }
    category_id        { 2 }
    condition_id       { 2 }
    burden_id          { 2 }
    area_id            { 2 }
    days_to_ship_id    { 2 }
    selling_price      { 3500 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
