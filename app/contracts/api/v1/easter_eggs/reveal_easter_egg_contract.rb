# frozen_string_literal: true

class Api::V1::EasterEggs::RevealEasterEggContract < Dry::Validation::Contract
  params do
    required(:easter_egg_id).filled(:integer)
    required(:code).filled(:string).value(size?: Constants::EasterEgg::UNIQUE_CODE_LENGTH)
  end

  rule(:easter_egg_id) do
    key.failure(:egg_is_already_revealed) if egg_revealed?(id: value)
  end

  rule(:code) do
    key.failure(:wrong_secret_code) unless code_matches?(values)
  end

  def egg_revealed?(id:)
    EasterEgg.find_by(id:).revealed?
  end

  def code_matches?(values)
    EasterEgg.find_by(id: values[:easter_egg_id]).code.casecmp(values[:code]).zero?
  end
end
