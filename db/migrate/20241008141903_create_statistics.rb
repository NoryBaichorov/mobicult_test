class CreateStatistics < ActiveRecord::Migration[7.1]
  def change
    create_table :statistics do |t|
      t.references :footballer, null: false, foreign_key: true
      t.references :match, null: false, foreign_key: true
      t.integer :kicks_on_goal
      t.integer :saves
      t.integer :assists
      t.integer :goals

      t.timestamps
    end
  end
end
