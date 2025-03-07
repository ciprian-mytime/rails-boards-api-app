class BoardPermission < ApplicationRecord
  belongs_to :user
  belongs_to :board

  enum :role, { no_access: 0, view_only: 1, edit: 2 }
end
