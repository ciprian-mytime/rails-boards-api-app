class Board < ApplicationRecord
    acts_as_paranoid

    has_many :board_permissions
    has_many :users, through: :board_permissions

    has_many :columns, dependent: :destroy
    has_many :stories, through: :columns
end
