require 'rails_helper'

RSpec.describe FollowRelationship, type: :model do
  it "is valid with followerand followee" do
  	followRelationship = FollowRelationship.new(follower_id: 1, followee_id: 2)
  	expect(followRelationship).to be_valid
	end
  it "is not valid without follower" do
  	followRelationship = FollowRelationship.new(follower_id: nil)
  	expect(followRelationship).to_not be_valid
	end

  it "is not valid without followeee" do
  	followRelationship = FollowRelationship.new(followee_id: nil)
  	expect(followRelationship).to_not be_valid
	end
end