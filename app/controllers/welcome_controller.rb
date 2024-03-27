class WelcomeController < ApplicationController
  def index
    @subscription = Subscription.new
  end

  def support

    @title = "Поддержка"

  end

  def about

  end

  def covers
    # @posts = Post.all

    @title = "Обложки"

    if params[:sort] == "likes_desc"
      @posts = CoverPost.left_joins(:likes).group(:id).order('COUNT(likes.id) DESC').paginate(page: params[:page])
    elsif params[:sort] == "likes_asc"
      @posts = CoverPost.left_joins(:likes).group(:id).order('COUNT(likes.id) ASC').paginate(page: params[:page])
    elsif params[:sort] == "created_at_desc"
      @posts = CoverPost.order('created_at DESC').paginate(page: params[:page])
    elsif params[:sort] == "created_at_asc"
      @posts = CoverPost.order('created_at ASC').paginate(page: params[:page])
    else
      @posts = CoverPost.paginate(page: params[:page])
    end
    
  end

  def videos
    # @posts = Post.all
  
    @title = "Видеоклипы"

    if params[:sort] == "likes_desc"
      @posts = VideoPost.left_joins(:likes).group(:id).order('COUNT(likes.id) DESC').paginate(page: params[:page])
    elsif params[:sort] == "likes_asc"
      @posts = VideoPost.left_joins(:likes).group(:id).order('COUNT(likes.id) ASC').paginate(page: params[:page])
    elsif params[:sort] == "created_at_desc"
      @posts = VideoPost.order('created_at DESC').paginate(page: params[:page])
    elsif params[:sort] == "created_at_asc"
      @posts = VideoPost.order('created_at ASC').paginate(page: params[:page])
    else
      @posts = VideoPost.paginate(page: params[:page])
    end
    
  end

  def promos
    # @posts = Post.all

    @title = "Промо-кампании"


    if params[:sort] == "likes_desc"
      @posts = PromoPost.left_joins(:likes).group(:id).order('COUNT(likes.id) DESC').paginate(page: params[:page])
    elsif params[:sort] == "likes_asc"
      @posts = PromoPost.left_joins(:likes).group(:id).order('COUNT(likes.id) ASC').paginate(page: params[:page])
    elsif params[:sort] == "created_at_desc"
      @posts = PromoPost.order('created_at DESC').paginate(page: params[:page])
    elsif params[:sort] == "created_at_asc"
      @posts = PromoPost.order('created_at ASC').paginate(page: params[:page])
    else
      @posts = PromoPost.paginate(page: params[:page])
    end

  end
  
end
