FactoryBot.define do
  factory :column do
    association :board
    title {'Factory Column Title'}
    board_id {1}
    order {1}
  end
end