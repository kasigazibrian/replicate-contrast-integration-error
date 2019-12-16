# frozen_string_literal: true

FactoryBot.define do
  factory :like do
    for_post # Default to post if no trait is specified.

    trait :for_post do
      association :likable, factory: :post
    end

    trait :for_comment do
      association :likable, factory: :comment
    end
  end
end