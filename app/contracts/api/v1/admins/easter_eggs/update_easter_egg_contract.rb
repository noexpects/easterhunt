# frozen_string_literal: true

class Api::V1::Admins::EasterEggs::UpdateEasterEggContract < Dry::Validation::Contract
  params do
    required(:id).filled(:integer)
    optional(:latitude).maybe(:decimal, gteq?: Constants::EasterEgg::LATITUDE_MIN,
                                        lteq?: Constants::EasterEgg::LATITUDE_MAX)
    optional(:longitude).maybe(:decimal, gteq?: Constants::EasterEgg::LONGITUDE_MIN,
                                         lteq?: Constants::EasterEgg::LONGITUDE_MAX)
    optional(:clue).maybe(:string, max_size?: Constants::EasterEgg::CLUE_MAX_LENGTH)
  end

  rule(:latitude) do
    key.failure(:wrong_format) unless matches_format?(:latitude, value)
  end

  rule(:longitude) do
    key.failure(:wrong_format) unless matches_format?(:longitude, value)
  end

  rule(:id) do
    key.failure(:not_exists) unless egg_exists?(value)
  end

  private

  def matches_format?(key, value)
    Constants::EasterEgg::COORDINATES_FORMATS[key].match?(value.to_s)
  end

  def egg_exists?(id)
    EasterEgg.exists?(id:)
  end
end
