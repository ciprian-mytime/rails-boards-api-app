Story.destroy_all
Column.destroy_all
Board.destroy_all

boards = []
3.times do |i|
  boards << Board.create!(title: "Board #{i + 1}")
end

columns = []
boards.each do |board|
  3.times do |i|
    columns << board.columns.create!(title: "Column #{i + 1}", order: i + 1)
  end
end

columns.each do |column|
  5.times do |i|
    column.stories.create!(
      title: "Story #{i + 1} in #{column.title}",
      description: "This is a description for Story #{i + 1}",
      order: i + 1
    )
  end
end