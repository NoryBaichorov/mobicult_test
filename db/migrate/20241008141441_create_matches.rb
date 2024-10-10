class CreateMatches < ActiveRecord::Migration[7.1]
  def change
    create_table :matches do |t|
      t.string :date
      t.float :weight

      t.timestamps
    end
  end
end
