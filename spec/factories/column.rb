FactoryBot.define do
  factory :column do
    id {1}
    association :board
    title {'Factory Column Title'}
    board_id {1}
    order {1}
  end
end