# frozen_string_literal: true

class CreateNumbers < ActiveRecord::Migration[6.1]
  def change
    create_table :numbers do |t|
      t.integer :number, null: false

      t.timestamps
    end
  end
end
