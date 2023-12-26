# frozen_string_literal: true

class Api::V1::EasterEggs::EasterEggsQuery
  def self.call(params)
    easter_eggs = EasterEgg.all

    easter_eggs = easter_eggs.filter_by_revealed_status(params[:revealed]) if params[:revealed].present?
    easter_eggs = easter_eggs.filter_by_hunter_email(params[:hunter_email]) if params[:hunter_email].present?

    easter_eggs
  end
end
