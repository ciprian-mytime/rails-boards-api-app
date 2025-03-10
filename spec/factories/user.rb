FactoryBot.define do
  factory :user do
    id {1}
    email { 'user@test.com' }
    password { "password" }
    password_confirmation { "password" }
  end
end