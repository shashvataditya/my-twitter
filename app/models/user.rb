class User < ActiveRecord::Base
	attr_accessor :name, :email, :password
	has_many :followers, :class_name => 'Follower', :foreign_key => 'followee_id'
  	has_many :followees, :class_name => 'Follower', :foreign_key => 'follower_id'
	has_one :profile
	has_many :tweets
end
