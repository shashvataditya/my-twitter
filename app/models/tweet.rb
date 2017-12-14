class Tweet < ActiveRecord::Base
	#attr_accessor :content
	belongs_to :user

	validates :content, presence: true
	validates :user_id, presence: true
	default_scope { order(created_at: :desc) }
end
