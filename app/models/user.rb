class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	attr_accessor :name, :username
	has_many :followers, :through => 'Follower', :foreign_key => 'followee_id'
  	has_many :followees, :through => 'Follower', :foreign_key => 'follower_id'
	has_one :profile
	has_many :tweets

	validates :name, presence: true
	validates :username, presence: true, uniqueness: true
	#validates :email, presence: true, uniqueness: true
	#validates :password, presence: true#, 
				#format: { with: /^(?=.*[A-Za-z]).{8,}$/,
				#message: "Password doesn't satisfy the rules" }
end
