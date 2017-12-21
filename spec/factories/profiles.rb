FactoryGirl.define do
  factory :profile do
    about     			{ "random about - test" }
    schoolname          { "random school - test" }
  end

  factory :beforeupdateprofile , parent: :profile do |t|
    user_id     			{ 1 }
  end
end