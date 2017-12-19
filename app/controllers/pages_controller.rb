class PagesController < ApplicationController
	before_action :authenticate_user!, :except => [:index]
	def index
	end

	def home
		@allTweets = Tweet.all

		@newTweet = Tweet.new
	end

	def profile
		if(User.find_by_username(params[:id]))
			@profileUser = User.find_by_username(params[:id])
			@username = params[:id]
		else
			redirect_to root_path, :notice=> "User does not exist!"
		end

		if(Profile.exists?(:user_id => @profileUser.id))
			@profile = @profileUser.profile
			@profileExists = true
		else
			@profileExists = false;
		end
		@userTweets = Tweet.all.where("user_id = ?", User.find_by_username(params[:id]).id)
	end
end