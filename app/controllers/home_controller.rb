class HomeController < ApplicationController
  def welcome
  	@newpost = Post.new

  	@tweets = Tweet.all
  end
end
