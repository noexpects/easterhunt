# frozen_string_literal: true

class Api::V1::AdminEasterEggSerializer < ApplicationSerializer
  set_type :easter_egg

  attributes :id, :latitude, :longitude, :code, :clue, :revealed

  belongs_to :hunter, if: proc { |record| record.revealed? }, serializer: Api::V1::HunterSerializer
end
