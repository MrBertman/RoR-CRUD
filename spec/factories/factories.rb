FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password "password"
    password_confirmation "password"
    #confirmed_at Date.today
  end

  factory :task do
    user { association(:user) }
    #association :user_id, factory: :user, strategy: :create
    name "tsk"
    description "desc"
    created_at Date.today()
    updated_at Date.today()
  end
end