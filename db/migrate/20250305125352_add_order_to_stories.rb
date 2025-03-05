class AddOrderToStories < ActiveRecord::Migration[8.0]
  def change
    add_column :stories, :order, :integer
  end
end
