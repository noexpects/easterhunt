# frozen_string_literal: true

require 'administrate/base_dashboard'

class EasterEggDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    clue: Field::Text,
    code: Field::String,
    hunter: Field::BelongsTo,
    latitude: Field::String.with_options(searchable: false),
    longitude: Field::String.with_options(searchable: false),
    revealed: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    clue
    code
    revealed
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    clue
    code
    hunter
    latitude
    longitude
    revealed
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    clue
    latitude
    longitude
  ].freeze

  COLLECTION_FILTERS = {}.freeze
end
