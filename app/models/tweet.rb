class Tweet < ActiveRecord::Base
	attr_accessor :content
	belongs_to :user

	validates :content, presence: true
end
