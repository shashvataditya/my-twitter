FactoryGirl.define do
  factory :tweet do |t|
    t.content     		{ "random" }
  end

  factory :invalid_tweet, parent: :tweet do |t|
    t.content     		{ nil }
  end
end