# frozen_string_literal: true

class Api::V1::Admins::EasterEggsController < ApplicationController
  before_action :authenticate_admin!

  def index
    easter_eggs = Api::V1::EasterEggs::EasterEggsQuery.call(params)

    render_response(code: 200, message: :ok, status: :ok, easter_egg: easter_eggs)
  end

  def create
    result = Api::V1::EasterEggs::CreateEasterEggService.new(permitted_params)
    result.call

    if result.ok?
      render_response(code: 201, message: I18n.t('easter_egg.created'), status: :created, easter_egg: result.easter_egg)
    else
      validation_errors(result.contract.errors)
    end
  end

  def update
    result = Api::V1::EasterEggs::UpdateEasterEggService.new(permitted_params.merge(id: params[:id]))
    result.call

    if result.ok?
      render_response(code: 200, message: I18n.t('easter_egg.updated'), status: :ok, easter_egg: result.easter_egg)
    else
      validation_errors(result.contract.errors)
    end
  end

  private

  def render_response(code:, message:, status:, easter_egg:)
    render json: {
      status: { code:, message: },
      data: Api::V1::AdminEasterEggSerializer.new(easter_egg).serializable_hash
    }, status:
  end

  def permitted_params
    params.require(:easter_egg).permit(:latitude, :longitude, :clue)
  end
end
