class Story < ApplicationRecord
    acts_as_paranoid
    has_paper_trail
    
    belongs_to :column
end
