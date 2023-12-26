# frozen_string_literal: true

class EasterEgg < ApplicationRecord
  belongs_to :hunter, optional: true

  scope :filter_by_revealed_status, ->(revealed) { where(revealed:) }

  scope :filter_by_hunter_email, lambda { |email|
    joins(:hunter).where(hunters: { email: })
  }
end
