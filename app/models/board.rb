class Board < ApplicationRecord
    acts_as_paranoid
    has_many :columns, dependent: :destroy
    has_many :stories, through: :columns
end
