class AddDueDateToStories < ActiveRecord::Migration[8.0]
  def change
    add_column :stories, :due_date, :datetime
  end
end
