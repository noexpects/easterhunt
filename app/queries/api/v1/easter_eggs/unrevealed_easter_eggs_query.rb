# frozen_string_literal: true

class Api::V1::EasterEggs::UnrevealedEasterEggsQuery
  def self.call
    EasterEgg.where(revealed: false)
  end
end
