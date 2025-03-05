class AddColumnToStories < ActiveRecord::Migration[8.0]
  def change
    add_reference :stories, :column, null: false, foreign_key: true
  end
end
