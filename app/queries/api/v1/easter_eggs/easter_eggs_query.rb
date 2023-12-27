# frozen_string_literal: true

class Api::V1::EasterEggs::EasterEggsQuery
  def self.call(params)
    easter_eggs = EasterEgg.all

    easter_eggs = easter_eggs.where(revealed: params[:revealed]) if params[:revealed].present?
    if params[:hunter_email].present?
      easter_eggs = easter_eggs.joins(:hunter).where(hunters: { email: params[:hunter_email] })
    end

    easter_eggs
  end
end
