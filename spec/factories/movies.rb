FactoryBot.define do
  factory :movie do
    title { Faker::Movie.title }
    description { "MyText" }
    rent_price { "9.99" }
    association :category
  end
end
