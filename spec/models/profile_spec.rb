require 'rails_helper'

RSpec.describe Profile, type: :model do
  it "is valid without about" do
  	profile = Profile.new(about: nil)
  	expect(profile).to be_valid
	end

  it "is not valid without user_id" do
  	profile = Profile.new(user_id: nil)
  	expect(profile).to be_valid
	end
end