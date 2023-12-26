# frozen_string_literal: true

class AdminPanel::EasterEggsController < AdminPanel::AdminApplicationController
  def create
    result = Api::V1::EasterEggs::CreateEasterEggService.new(permitted_params)
    result.call

    if result.ok?
      redirect_to(
        after_resource_created_path(result.easter_egg),
        notice: translate_with_resource('create.success')
      )
    else
      render_validation_errors(result)
    end
  end

  def update
    result = Api::V1::EasterEggs::UpdateEasterEggService.new(permitted_params.merge(id: params[:id]))
    result.call

    if result.ok?
      redirect_to(
        after_resource_updated_path(result.easter_egg),
        notice: translate_with_resource('update.success')
      )
    else
      render_validation_errors(result)
    end
  end

  private

  def permitted_params
    params.require(:easter_egg).permit(:latitude, :longitude, :clue)
  end

  def format_validation_errors(errors)
    errors.to_h.map { |key, value| "#{key.capitalize}: #{value.join(', ')}" }.join(' | ')
  end

  def render_validation_errors(result)
    flash.now[:alert] = format_validation_errors(result.contract.errors)

    render :edit, locals: {
      page: Administrate::Page::Form.new(dashboard, result.easter_egg)
    }, status: :unprocessable_entity
  end
end
