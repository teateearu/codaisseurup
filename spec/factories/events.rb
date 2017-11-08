FactoryGirl.define do
  factory :event do
    name            { Faker::Name.words(2).join(' ') }
    description     { Faker::Lorem.sentence(40) }
    location        { Faker::Address.city }
    price           { Faker::Commerce.price }
    capacity        20
    includes_food   true
    includes_drinks true
    starts_at       { Faker::Time.between(DateTime.now - 1, DateTime.now) }
    ends_at         { Faker::Time.between(DateTime.now - 1, DateTime.now) }
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
