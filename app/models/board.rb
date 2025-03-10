class Board < ApplicationRecord
    acts_as_paranoid
    has_paper_trail

    has_many :board_permissions
    has_many :users, through: :board_permissions

    has_many :columns, dependent: :destroy
    has_many :stories, through: :columns

    validates :title, presence: true

    def count_stories
        self.stories.count
    end

    def dummy_print_column(column)
        column || "DUMMY CALL"
    end
end
