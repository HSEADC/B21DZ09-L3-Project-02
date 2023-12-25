class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  # load_and_authorize_resource

  # GET /posts or /posts.json
  def index
    @posts = Post.all

    @title = "Поиск"
  end

  def by_tag
    @posts = Post.tagged_with(params[:tag])
    @title = "Поиск"
    render :index
  end

  # GET /posts/1 or /posts/1.json
  def show
    @artist = Artist.find(params[:artist_id])
    @issue = Issue.find(params[:issue_id])

    @title = @post.name
    @description = @post.description
  end

  # GET /posts/new
  def new
    # @artist = Artist.find(params[:artist_id])
    # @issue = Issue.find(params[:issue_id])
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @artist = @post.issue.artist
    @issue = @post.issue
  end

  # POST /posts or /posts.json
  def create
    # p = nil
    # if params[:post]
    #   p = post_params
    # elsif params[:cover_post]
    #   p = cover_post_params
    # end

    @artist = Artist.find(params[:post][:artist_id])
    @issue = Issue.find(params[:post][:issue_id])
    @post = Post.new(name: params[:post][:name], type: params[:post][:type], description: params[:post][:description], body: params[:post][:body], post_image: params[:post][:post_image], tag_list: params[:post][:tag_list], issue_id: @issue.id, user_id: current_user.id)

    respond_to do |format|
      if @post.save
        format.html { redirect_to artist_issue_post_url(@artist, @issue, @post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    @artist = Artist.find(params[:artist_id])
    @issue = Issue.find(params[:issue_id])

    respond_to do |format|
      if @post.update(sti_post_params)
        format.html { redirect_to artist_issue_post_path(@artist, @issue, @post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @artist = Artist.find(@post.issue.artist_id)
    @issue = Issue.find(@post.issue_id)
    @post = @issue.posts.find(params[:id])

    type = @post.type
    url = nil

    if type == "CoverPost"
      url = welcome_covers_url
    elsif type == "VideoPost"
      url = welcome_videos_url
    elsif type == "PromoPost"
      url = welcome_promos_url
    end

    @post.destroy

    respond_to do |format|
      format.html { redirect_to url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    # def post_params
    #   params.require(:post).permit(:type, :name, :description, :body, :issue_id, :post_image).merge(user_id: current_user.id)
    # end

    # def cover_post_params
    #   params.require(:cover_post).permit(:type, :name, :description, :body, :issue_id, :post_image).merge(user_id: current_user.id)
    # end

    # def video_post_params
    #   params.require(:video_post).permit(:type, :name, :description, :body, :issue_id, :post_image).merge(user_id: current_user.id)
    # end

    # def promo_post_params
    #   params.require(:promo_post).permit(:type, :name, :description, :body, :issue_id, :post_image).merge(user_id: current_user.id)
    # end

    # def feed
    #   @posts = Post.all
    # end

    def sti_post_params
      p = nil
      if params[:post]
        p = params.require(:post)
      elsif params[:cover_post]
        p = params.require(:cover_post)
      elsif params[:video_post]
        p = params.require(:video_post)
      elsif params[:promo_post]
        p = params.require(:promo_post)
      end

      p.permit(:type, :name, :description, :body, :issue_id, :post_image, :tag_list).merge(user_id: current_user.id)
    end
end
