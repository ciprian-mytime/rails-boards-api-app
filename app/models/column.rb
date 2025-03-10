class Column < ApplicationRecord
    acts_as_paranoid
    has_paper_trail
    
    belongs_to :board
    has_many :stories, dependent: :destroy

    validates :title, presence: true
    validates :order, presence: true
    validates :board_id, presence: true

    def move_up
        self.order = self.order - 1
    end
    def move_down
        self.order = self.order + 1
    end
end
