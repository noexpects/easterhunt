# frozen_string_literal: true

FactoryBot.define do
  factory :hunter do
    email { FFaker::Internet.unique.email }
    password { FFaker::Lorem.characters(10) }
  end
end
