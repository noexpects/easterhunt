# frozen_string_literal: true

class DeviseCreateHunters < ActiveRecord::Migration[7.0]
  def change
    create_table :hunters do |t|
      t.string :email,              null: false, default: ''
      t.string :encrypted_password, null: false, default: ''

      t.timestamps null: false
    end

    add_index :hunters, :email, unique: true
  end
end
