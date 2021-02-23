FactoryBot.define do
  factory :user do
    email { 'joe@gmail.com' }
    password { 'blahblah' }
    role { 1 }
  end
end
