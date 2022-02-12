class CreateMovements < ActiveRecord::Migration[6.1]
  def change
    create_table :movements do |t|
      t.float :quantity
      t.text :description
      t.references :account, null: false, foreign_key: true
      t.references :type_movement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
