FactoryGirl.define do
  factory :user do
    email 'admin@admin.com'
    password 'qwerty'
    password_confirmation 'qwerty'
    role 1
  end
end
