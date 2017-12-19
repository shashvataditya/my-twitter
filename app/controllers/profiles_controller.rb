class ProfilesController < ApplicationController
  before_filter :authenticate_user!
	
	def editprofile
		@newprofile = Profile.all.where("user_id = ?", current_user.id).first || Profile.create(:user_id => current_user.id)
	end

	def new
	end

=begin
	def create

			userprofile = current_user.profile
			respond_to do |f|
				if(userprofile.update_attributes!(profile_params))
					f.html { redirect_to :back, notice: "Profile Updated!" }
				else
					f.html { redirect_to :back, notice: "Error: Profile could not be updated!" }
				end
			end
	end
=end
	def update
		if(Profile.exists?(:user_id => current_user.id))
			userprofile = current_user.profile
			respond_to do |f|
				if(userprofile.update_attributes!(profile_params))
					f.html { redirect_to :back, notice: "Profile Updated!" }
				else
					f.html { redirect_to :back, notice: "Error: Profile could not be updated!" }
				end
			end
		else
			userprofile = Profile.new(profile_params)
			userprofile.user_id = current_user.id
			respond_to do |f|
				if(userprofile.save)
					f.html { redirect_to :back, notice: "Profile Updated!" }
				else
					f.html { redirect_to :back, notice: "Error: Profile could not be updated!" }
				end
			end
		end
	end

	private
    def profile_params
      params.require(:profile).permit(:user_id, :about, :schoolname)
    end
end