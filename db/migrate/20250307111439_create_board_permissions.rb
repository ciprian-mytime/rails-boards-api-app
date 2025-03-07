class CreateBoardPermissions < ActiveRecord::Migration[8.0]
  def change
    create_table :board_permissions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :board, null: false, foreign_key: true
      t.integer :role

      t.timestamps
    end
  end
end
