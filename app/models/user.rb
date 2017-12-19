class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:username]
	#attr_accessor :name, :username
	has_many :followers, :through => 'Follower', :foreign_key => 'followee_id'
  	has_many :followees, :through => 'Follower', :foreign_key => 'follower_id'
	has_one :profile
	has_many :tweets

	validates :username, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true
	#validates :password, length: { minimum: 8 }, unless: "password.nil?"
	#validates :password, presence: true, if: "id.nil?"
	validates :password, format: { with: /\A(?=.*[A-Za-z]).{8,}\z/, message: "Password must include at least 1 alphabet" }, unless: "password.nil?"
end
