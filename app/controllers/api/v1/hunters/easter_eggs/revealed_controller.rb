# frozen_string_literal: true

class Api::V1::Hunters::EasterEggs::RevealedController < ApplicationController
  before_action :authenticate_hunter!

  def index
    revealed_eggs = current_hunter.easter_eggs
    render json: {
      status: { code: 200, message: :ok },
      data: Api::V1::EasterEggSerializer.new(revealed_eggs).serializable_hash[:data].pluck(:attributes)
    }, status: :ok
  end
end
