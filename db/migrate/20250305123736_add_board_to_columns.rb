class AddBoardToColumns < ActiveRecord::Migration[8.0]
  def change
    add_reference :columns, :board, null: false, foreign_key: true
  end
end
