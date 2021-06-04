FactoryBot.define do
  factory :category do
    title { Faker::Name.unique.name }
  end
end
