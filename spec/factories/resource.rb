# frozen_string_literal: true
FactoryGirl.define do
  sequence(:link) do |n|
    "#{Faker::Internet.url}-#{n}"
  end

  factory :resource do
    link

    trait :preview_image do
      preview { preview_with_image }
    end

    trait :no_preview_image do
      preview { preview_with_no_image }
    end
  end
end

def preview_with_no_image
  {
    "url"         => "https://www.udacity.com/",
    "description" => "Find free online courses, make a career change, or get a new job by completing a Nanodegree program. Self paced online learning with code reviews.",
  }
end

def preview_with_image
  {
    "url"         => "https://www.udacity.com/",
    "favicon"     => "https://d125fmws0bore1.cloudfront.net/assets/favicon-3867f43151ecbff486335ae6a96d17d91d6169d20888131b4681d15b65e1425b.ico",
    "title"       => "Udacity - Free Online Classes & Nanodegrees",
    "description" => "Find free online courses, make a career change, or get a new job by completing a Nanodegree program. Self paced online learning with code reviews.",
    "images"      => [
      {
        "src"  => "https://d125fmws0bore1.cloudfront.net/assets/udacity_share-46db4b8faf075a5af5a1070a7fa0ad3639783609ff45f447e4ea467fe3aa9d32.png",
        "size" => [
          1200,
          630
        ],
        "type" => "png"
      }
    ],
  }
end
