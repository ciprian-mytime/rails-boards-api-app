class Column < ApplicationRecord
    acts_as_paranoid
    has_paper_trail
    
    belongs_to :board
    has_many :stories, dependent: :destroy
end
