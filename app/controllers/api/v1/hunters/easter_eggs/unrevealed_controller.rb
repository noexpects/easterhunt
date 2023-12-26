# frozen_string_literal: true

class Api::V1::Hunters::EasterEggs::UnrevealedController < ApplicationController
  before_action :authenticate_hunter!

  def index
    unrevealed_eggs = Api::V1::EasterEggs::UnrevealedEasterEggsQuery.call
    render json: {
      status: { code: 200, message: :ok },
      data: Api::V1::EasterEggSerializer.new(unrevealed_eggs).serializable_hash[:data].pluck(:attributes)
    }, status: :ok
  end
end
