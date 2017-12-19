class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:username]
	#attr_accessor :name, :username
	has_one :profile

	has_many :tweets, dependent: :destroy
	has_many :follower_relationships, class_name: "FollowRelationship", foreign_key: "follower_id", dependent: :destroy
	has_many :followee_relationships, class_name: "FollowRelationship", foreign_key: "followee_id", dependent: :destroy
	
	has_many :following, through: :follower_relationships, source: :followee, class_name: "User"
	has_many :followers, through: :followee_relationships, source: :follower, class_name: "User"

	validates :username, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true
	#validates :password, length: { minimum: 8 }, unless: "password.nil?"
	#validates :password, presence: true, if: "id.nil?"
	validates :password, format: { with: /\A(?=.*[A-Za-z]).{8,}\z/, message: "Password must include at least 1 alphabet" }, unless: "password.nil?"

	def follow(otheruser)
		follower_relationships.create(followee_id: otheruser.id)
	end

	def unfollow(otheruser)
		follower_relationships.find_by(followee_id: otheruser.id).destroy
	end

	def following?(otheruser)
		following.include?(otheruser)
	end
end
