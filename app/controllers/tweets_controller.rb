class TweetsController < ApplicationController

	def new
	end

	def create
		@tweet = Tweet.new(tweet_params)
		@tweet.user_id = current_user.id
		respond_to do |f|
			if(@tweet.save)
				f.html { redirect_to "", notice: "Tweet Created!" }
			else
				f.html { redirect_to "", notice: "Error: Tweet could not be created!" }
			end
		end
	end

	private
	def tweet_params
		params.require(:tweet).permit(:user_id, :content)
	end
end