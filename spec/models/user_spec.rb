require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with username, email, and valid password" do
    expect(User.new(username: "randomusername", email: "randomemail@gmail.com", password: "random123")).to be_valid
  end
  it "is not valid without username" do
  	user = User.new(username: nil, email: "randomemail@gmail.com", password: "random123")
    expect(user).to_not be_valid
	end
  it "is not valid without email" do
    user = User.new(username: "randomusername", email: nil, password: "random123")
    expect(user).to_not be_valid
  end
  it "is not valid without valid password" do
    user = User.new(username: "randomusername", email: "randomemail@gmail.com", password: "random")
    expect(user).to_not be_valid
  end

  describe "Associations" do
    it "has one profile" do
      assc = described_class.reflect_on_association(:profile)
      expect(assc.macro).to eq :has_one
    end

    it "has many tweets" do
      assc = described_class.reflect_on_association(:tweets)
      expect(assc.macro).to eq :has_many
    end
  end
end