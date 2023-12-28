# frozen_string_literal: true

class CreateEasterEggs < ActiveRecord::Migration[7.0]
  def change
    create_table :easter_eggs do |t|
      t.string :code
      t.float :latitude
      t.float :longitude
      t.text :clue
      t.boolean :revealed, null: false, default: false

      t.references :hunter, foreign_key: true, null: true

      t.timestamps
    end
  end
end
