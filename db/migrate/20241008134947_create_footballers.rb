# frozen_string_literal: true

class CreateFootballers < ActiveRecord::Migration[7.1]
  def change
    create_table :footballers do |t|
      t.string :name
      t.string :team
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
