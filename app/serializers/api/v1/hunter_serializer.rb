# frozen_string_literal: true

class Api::V1::HunterSerializer < ApplicationSerializer
  set_type :hunter

  attributes :id, :email, :created_at
end
