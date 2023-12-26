# frozen_string_literal: true

class Api::V1::EasterEggs::RevealEasterEggService < BaseService
  attr_reader :easter_egg, :contract

  def initialize(params, hunter_id)
    @params = params
    @hunter_id = hunter_id
    @contract = Api::V1::EasterEggs::RevealEasterEggContract.new
  end

  def call
    validate_params
    return unless ok?

    @easter_egg = EasterEgg.find_by(id: @params[:easter_egg_id])
    easter_egg.update(revealed: true, hunter_id: @hunter_id)
  end
end
