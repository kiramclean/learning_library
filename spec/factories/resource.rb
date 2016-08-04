# frozen_string_literal: true
FactoryGirl.define do
  sequence(:link) do |n|
    "#{Faker::Internet.url}-#{n}"
  end

  factory :resource do
    link
  end
end
