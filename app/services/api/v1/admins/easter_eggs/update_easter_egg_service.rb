# frozen_string_literal: true

class Api::V1::Admins::EasterEggs::UpdateEasterEggService < BaseService
  attr_reader :easter_egg, :contract

  def initialize(params)
    @params = params
    @easter_egg = EasterEgg.find_by(id: @params[:id])
    @contract = Api::V1::Admins::EasterEggs::UpdateEasterEggContract.new
  end

  def call
    validate_params
    return unless ok?

    easter_egg.update(@params.except(:id))
  end
end
