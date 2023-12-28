# frozen_string_literal: true

FactoryBot.define do
  factory :easter_egg do
    code { FFaker::Lorem.characters(8) }
    latitude { FFaker::Geolocation.lat.round(5) }
    longitude { FFaker::Geolocation.lng.round(5) }
    clue { FFaker::Lorem.sentence(10) }
    revealed { false }
    hunter { nil }
  end
end
