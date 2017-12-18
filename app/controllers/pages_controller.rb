class PagesController < ApplicationController
	def index
	end

	def home
		@allTweets = Tweet.all

		@newTweet = Tweet.new
	end

	def profile
		if(User.find_by_username(params[:id]))
			@username = params[:id]
		else
			redirect_to root_path, :notice=> "Profile does not exist!"
		end

		@tweets = Tweet.all.where("user_id = ?", User.find_by_username(params[:id]).id)
	end
end
