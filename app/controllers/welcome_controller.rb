class WelcomeController < ApplicationController
  def index
    @subscription = Subscription.new
  end

  def about
  end

  def feed
    @posts = Post.all
  end
end
