class HomeController < ApplicationController
  def welcome
  	if (User.find_by_username(params[:id]))
  		@username = params[:id]
  	end

  	@tweets = Tweet.all
  end
end
