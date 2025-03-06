Story.destroy_all
Column.destroy_all
Board.destroy_all

boards = []
4.times do |i|
  boards << Board.create!(title: "Board #{i + 1}")
end

columns = []
boards.each do |board|
  columns << board.columns.create!(title: "icebox", order: 1)
  columns << board.columns.create!(title: "backlog", order: 2)
  columns << board.columns.create!(title: "pending", order: 3)
  columns << board.columns.create!(title: "in-progress", order: 4)
  columns << board.columns.create!(title: "finished", order: 5)
  columns << board.columns.create!(title: "delivered", order: 6)
end

columns.each do |column|
  5.times do |i|
    column.stories.create!(
      title: "Story no. #{i + 1} in #{column.title}",
      description: "This is a description for Story #{i + 1}",
      status: "active",
      due_date: "20-Aug-2029",
      order: i + 1
    )
  end
end