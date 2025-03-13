class Story < ApplicationRecord
    acts_as_paranoid
    has_paper_trail

    belongs_to :column

    validates :title, presence: true
    validates :order, presence: true
    validates :column_id, presence: true

    def move_up
        self.order = self.order - 1
    end
    def move_down
        self.order = self.order + 1
    end
end
