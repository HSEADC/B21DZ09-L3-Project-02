class WelcomeController < ApplicationController
  def index
    @subscription = Subscription.new
  end

  def about
  end

  def covers
    @posts = Post.all

    @title = "Обложки"
  end

  def videos
    @posts = Post.all

    @title = "Видеоклипы"
  end

  def promos
    @posts = Post.all

    @title = "Промо-кампании"
  end
end
