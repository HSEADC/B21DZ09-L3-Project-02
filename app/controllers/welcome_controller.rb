class WelcomeController < ApplicationController
  def index
    @subscription = Subscription.new
  end

  def about
  end

  def covers
    @posts = Post.all
  end

  def videos
    @posts = Post.all
  end

  def promos
    @posts = Post.all
  end
end
