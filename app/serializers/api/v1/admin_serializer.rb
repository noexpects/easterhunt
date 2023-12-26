# frozen_string_literal: true

class Api::V1::AdminSerializer < ApplicationSerializer
  set_type :admin

  attributes :id, :email, :created_at
end
