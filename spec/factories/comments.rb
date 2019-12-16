# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    post
    body { Faker::Lorem.sentence }

    trait :short_body do
      body {"short body"}
    end

    trait :long_body do
      body { Faker::Lorem.paragraph }
    end

    factory :my_comment, traits: [:long_body]
  end

  factory :test_comment, parent: :comment do
    after(:create) do |c|
      c.post = create(:my_post)
    end
  end

  factory :testing, parent: :test_comment do
    after(:create) do |c|
      c.post = create(:my_post)
    end
  end

  factory :more_testing, parent: :testing do
    body { 'This is more testing' }
  end
end
