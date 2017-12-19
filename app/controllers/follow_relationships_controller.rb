class FollowRelationshipsController < ApplicationController
	def create
		user = User.find(params[:followee_id])
		current_user.follow(user)
		redirect_to(:back)
	end

	def destroy
		user = FollowRelationship.find(params[:id]).followee
		current_user.unfollow(user)
		redirect_to(:back)
	end
end