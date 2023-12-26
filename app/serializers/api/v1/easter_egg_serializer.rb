# frozen_string_literal: true

class Api::V1::EasterEggSerializer < ApplicationSerializer
  set_type :easter_egg

  attributes :id, :latitude, :longitude, :clue, :revealed

  belongs_to :hunter, if: proc { |record| record.revealed? }, serializer: Api::V1::HunterSerializer
end
