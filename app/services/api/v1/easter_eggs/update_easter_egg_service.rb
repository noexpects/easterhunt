# frozen_string_literal: true

class Api::V1::EasterEggs::UpdateEasterEggService < BaseService
  attr_reader :easter_egg, :contract

  def initialize(params)
    @params = params
    @contract = Api::V1::EasterEggs::UpdateEasterEggContract.new
  end

  def call
    validate_params
    return unless ok?

    @easter_egg = EasterEgg.find_by(id: @params[:id])
    easter_egg.update(@params.except(:id))
  end
end
