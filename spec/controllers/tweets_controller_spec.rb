require 'spec_helper'
require 'rails_helper'

describe TweetsController do
  login_user
  describe "Check user login" do

	  it "should have a current_user" do
	    # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
	    expect(subject.current_user).to_not eq(nil)
	  end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates the new tweet in the database" do
      	expect{
        post :create, tweet: FactoryGirl.attributes_for(:tweet)}.to change(Tweet,:count).by(1)
      end
    end
    
    context "with invalid attributes" do
      it "does not save the new contact in the database" do 
      	#User.create(username: "randomusername", email: "randomemail@gmail.com", password: "random123");
      	before_count = Tweet.count
        post :create, tweet: FactoryGirl.attributes_for(:invalid_tweet)
        expect(Tweet.count).to eq(before_count)
      end
    end
  end
end