FactoryBot.define do
  factory :story do
    id {1}
    association :column
    title {'Factory Story Title'}
    column_id {1}
    order {1}
    description {"Factory Story Description"}
    status {"Factory Story Status"}
    due_date {Date.tomorrow}
  end
end