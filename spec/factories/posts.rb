# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title { Faker::Lorem.word }
    sequence(:body) { |n| "This is the body for post #{n}" }
  end

  trait :faker_body do
    body { Faker::Lorem.paragraph }
  end

  trait :awesome_title do
    title { Faker::Lorem.sentence }
  end

  factory :my_post, parent: :post do
    title { "Yeah this is the post" }
  end

  factory :post_with_comments, parent: :my_post do
    transient do
      comments_count { 3 }
    end
    after(:create) do |post, evaluator|
      create_list(:comment, evaluator.comments_count, post: post)
    end
  end

  factory :post_with_many_comments, parent: :post_with_comments do
    after(:create) do |post|
      post.comments << create_list(:comment, 5)
    end
  end
end
