# frozen_string_literal: true

class Api::V1::Admins::EasterEggs::CreateEasterEggService < BaseService
  attr_reader :easter_egg, :contract

  def initialize(params)
    @params = params
    @easter_egg = EasterEgg.new(params)
    @contract = Api::V1::Admins::EasterEggs::CreateEasterEggContract.new
  end

  def call
    validate_params
    return unless ok?

    easter_egg.save
    update_code
  end

  private

  def update_code
    easter_egg.update(code: generate_unique_code)
  end

  def generate_unique_code
    SecureRandom.hex(Constants::EasterEgg::UNIQUE_CODE_LENGTH / 2)
  end
end
