class AddOrderToStories < ActiveRecord::Migration[8.0]
  def change
    add_column :stories, :order, :integer, default: 0, null: false
  end
end
