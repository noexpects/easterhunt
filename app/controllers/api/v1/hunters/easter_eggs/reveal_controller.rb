# frozen_string_literal: true

class Api::V1::Hunters::EasterEggs::RevealController < ApplicationController
  before_action :authenticate_hunter!

  def create
    result = Api::V1::Hunters::EasterEggs::RevealEasterEggService.new(reveal_params, current_hunter.id)
    result.call

    if result.ok?
      render_response(code: 200, message: I18n.t('easter_egg.revealed'), status: :ok, easter_egg: result.easter_egg)
    else
      validation_errors(result.contract.errors)
    end
  end

  private

  def render_response(code:, message:, status:, easter_egg:)
    render json: {
      status: { code:, message: },
      data: Api::V1::EasterEggSerializer.new(easter_egg).serializable_hash
    }, status:
  end

  def reveal_params
    params.require(:reveal).permit(:id, :code)
  end
end
