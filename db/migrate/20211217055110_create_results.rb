# frozen_string_literal: true

class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.integer :result, null: false
      t.integer :iteration, null: false
      t.references :number, null: false, foreign_key: true

      t.timestamps
    end
  end
end
