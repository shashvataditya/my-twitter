require 'spec_helper'
require 'rails_helper'

describe PagesController do
  before(:each) do
    request.env["HTTP_REFERER"] = "where_i_came_from"
  end
  
  login_user
  
  describe "GET" do
    it "renders the home page" do
      get :home
      response.should render_template :home
    end
    
    it "renders the index view" do
      get :index
      response.should render_template :index
    end

    #it "renders the profile view" do
    #  Profile.create(about: "before test about", schoolname: "before test schoolname", user_id: subject.current_user.id)  
    #  params = {:id=>subject.current_user.id, format: :json}
    #  get :profile, params
    #  response.should render_template :profile
    #end

    it "renders the explore view" do
      get :explore
      response.should render_template :explore
    end
  end
end