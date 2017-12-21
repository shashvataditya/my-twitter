class FollowRelationshipsController < ApplicationController
	def create
		if(User.find_by_id(params[:followee_id]))
			user = User.find(params[:followee_id])
			current_user.follow(user)
			redirect_to(:back)
		else
			return_badrequest_status
		end
	end

	def destroy
		if(FollowRelationship.find_by_id(params[:id]).followee)
			user = FollowRelationship.find(params[:id]).followee
			current_user.unfollow(user)
			redirect_to(:back)
		else
			return_badrequest_status
		end
	end

	private
  	def return_badrequest_status
    	render :nothing => true, :status => :bad_request
  end

end