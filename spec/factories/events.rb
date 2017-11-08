FactoryGirl.define do
  factory :event do
    name            { Faker::Name.name }
    description     { Faker::Lorem.sentence(10) }
    location        { Faker::Address.city }
    price           { Faker::Commerce.price }
    capacity        20
    includes_food   true
    includes_drinks true
    starts_at       { Faker::Time.backward(14, :evening) }
    ends_at         { Faker::Time.forward(23, :evening) }
    active          true
    user            { build(:user) }

    trait :active do
      active true
    end

    trait :inactive do
      active false
    end
  end
end
