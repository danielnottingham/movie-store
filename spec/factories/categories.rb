FactoryBot.define do
  factory :category do
    title { Faker::Movie.title }
  end
end
