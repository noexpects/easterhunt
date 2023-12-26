# frozen_string_literal: true

require 'administrate/base_dashboard'

class HunterDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    easter_eggs: Field::HasMany,
    email: Field::String,
    encrypted_password: Field::String,
    jti: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    easter_eggs
    email
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    easter_eggs
    email
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    easter_eggs
    email
  ].freeze

  COLLECTION_FILTERS = {}.freeze

  def display_resource(hunter)
    hunter.email
  end
end
