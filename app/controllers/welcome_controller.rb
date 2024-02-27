class WelcomeController < ApplicationController
  def index
    @subscription = Subscription.new
  end

  def about
  end

  def covers
    # @posts = Post.all
    @posts = CoverPost.paginate(page: params[:page])

    @title = "Обложки"
  end

  def videos
    # @posts = Post.all
    @posts = VideoPost.paginate(page: params[:page])

    @title = "Видеоклипы"
  end

  def promos
    # @posts = Post.all
    @posts = PromoPost.paginate(page: params[:page])

    @title = "Промо-кампании"
  end
end
