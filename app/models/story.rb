class Story < ApplicationRecord
    acts_as_paranoid
    belongs_to :column
end
