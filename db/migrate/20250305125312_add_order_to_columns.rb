class AddOrderToColumns < ActiveRecord::Migration[8.0]
  def change
    add_column :columns, :order, :integer
  end
end
