# frozen_string_literal: true

module Constants
  module EasterEgg
    UNIQUE_CODE_LENGTH = 8
    CLUE_MAX_LENGTH = 200

    LATITUDE_MIN = -90.0
    LATITUDE_MAX = 90.0

    LONGITUDE_MIN = -180.0
    LONGITUDE_MAX = 180.0

    COORDINATES_FORMATS = {
      latitude: /^-?\d{1,2}(?:\.\d{1,6})?$/,
      longitude: /^-?\d{1,3}(?:\.\d{1,6})?$/
    }.freeze
  end
end
