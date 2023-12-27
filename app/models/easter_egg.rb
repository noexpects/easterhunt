# frozen_string_literal: true

class EasterEgg < ApplicationRecord
  belongs_to :hunter, optional: true
end
