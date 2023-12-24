# frozen_string_literal: true

class AddJtiToHunters < ActiveRecord::Migration[7.0]
  def change
    add_column :hunters, :jti, :string, null: false
    add_index :hunters, :jti, unique: true
  end
end
