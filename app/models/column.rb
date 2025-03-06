class Column < ApplicationRecord
    acts_as_paranoid
    belongs_to :board
    has_many :stories, dependent: :destroy
end
