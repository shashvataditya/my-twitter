require 'rails_helper'

RSpec.describe Tweet, type: :model do
  it "is valid with content and user_id" do
    expect(Tweet.new(content: "random content", user_id: 1)).to be_valid
  end
  it "is not valid without content" do
  	tweet = Tweet.new(content: nil)
  	expect(tweet).to_not be_valid
	end
  it "is not valid without content" do
	tweet = Tweet.new(user_id: nil)
	expect(tweet).to_not be_valid
end
end