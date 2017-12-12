class User < ActiveRecord::Base
	attr_accessor :name, :username, :email, :password
	has_many :followers, :class_name => 'Follower', :foreign_key => 'followee_id'
  	has_many :followees, :class_name => 'Follower', :foreign_key => 'follower_id'
	has_one :profile
	has_many :tweets

	validates :name, presence: true
	validates :username, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true
	validates :password, presence: true, 
				format: { with: /^(?=.*[A-Za-z]).{8,}$/,
				message: "Password doesn't satisfy the rules" }
end
