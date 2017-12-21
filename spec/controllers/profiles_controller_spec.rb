require 'spec_helper'
require 'rails_helper'

describe ProfilesController do
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

  describe "POST #create" do
    context "with valid attributes" do
      it "creates the new profile in the database" do
      	expect{
        put :update, id: subject.current_user.username, profile: FactoryGirl.attributes_for(:profile)}.to change(Profile,:count).by(1)
        response.should redirect_to "where_i_came_from"
      end
    end
  end

  describe "POST #update" do
    context "with valid attributes" do
      it "updated the profile in the database" do
        Profile.create(about: "before test about", schoolname: "before test schoolname", user_id: subject.current_user.id)
        put :update, id: subject.current_user.username, profile: FactoryGirl.attributes_for(:profile)
        newProfile = Profile.find_by_user_id(subject.current_user.id);
        expect(newProfile.about).to eq("random about - test")
        expect(newProfile.schoolname).to eq("random school - test")
        response.should redirect_to "where_i_came_from"
      end
    end
  end
end