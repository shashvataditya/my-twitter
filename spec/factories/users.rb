FactoryGirl.define do
  factory :user do |u|
    u.username     	{ Faker::Internet.user_name }
    u.email			{ Faker::Internet.email }
    u.password		{ "password123" }
    u.password_confirmation		{ "password123" }
    u.name 			{ Faker::Internet.user_name }
  end
end