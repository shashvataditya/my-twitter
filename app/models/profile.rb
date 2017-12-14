class Profile < ActiveRecord::Base
	#attr_accessor :about, :schoolname
	belongs_to :user
end
