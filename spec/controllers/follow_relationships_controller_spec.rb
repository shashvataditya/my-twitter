require 'spec_helper'
require 'rails_helper'

describe FollowRelationshipsController do
  before(:each) do
    request.env["HTTP_REFERER"] = "where_i_came_from"
  end

  login_user
  describe "Check user login" do

	  it "should have a current_user" do
	    # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
	    expect(subject.current_user).to_not eq(nil)
	  end
  end

  describe "POST #create follower" do
    context "with valid attributes" do
      it "creates a new follower for current user" do
        followingBeforeCount = subject.current_user.following.count
        newuser = FactoryGirl.create(:user)
        post :create, followee_id: newuser.id

        expect(subject.current_user.following.count).to eq(followingBeforeCount + 1)

      end
    end
  end

  describe "POST #destroy follower" do
    context "with valid attributes" do
      it "destroys an existing follower for current user" do
        newUser = FactoryGirl.create(:user)
        rel = FollowRelationship.create(follower_id: subject.current_user.id, followee_id: newUser.id)
        followingBeforeCount = subject.current_user.following.count
        post :destroy, id: rel.id

        expect(subject.current_user.following.count).to eq(followingBeforeCount - 1)

      end
    end
  end

  describe "POST #create follower" do
    context "with invalid attributes" do
      it "does not create a new follower for current user" do
        followingBeforeCount = subject.current_user.following.count
        newuser = FactoryGirl.create(:user)
        post :create, followee_id: newuser.id + 1

        expect(subject.current_user.following.count).to eq(followingBeforeCount)
        expect(response).to have_http_status(:bad_request)

      end
    end
  end
end