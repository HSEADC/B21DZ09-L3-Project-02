class Admin::PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  load_and_authorize_resource

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
    @artist = Artist.find(params[:artist_id])
    @issue = Issue.find(params[:issue_id])
  end

  # GET /posts/new
  def new
    @artist = Artist.find(params[:artist_id])
    @issue = Issue.find(params[:issue_id])
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @artist = @post.issue.artist
    @issue = @post.issue
  end

  # POST /posts or /posts.json
  def create
    @artist = Artist.find(params[:artist_id])
    @issue = Issue.find(params[:issue_id])
    @post = Post.new(name:params[:post][:name], description: params[:post][:description], body: params[:post][:body], post_image: params[:post][:post_image], issue_id: @issue.id, user_id: current_user.id)

    respond_to do |format|
      if @post.save
        format.html { redirect_to admin_artist_issue_url(@artist, @issue), notice: "Post was successfully created." }
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
      if @post.update(post_params)
        format.html { redirect_to admin_artist_issue_post_path(@artist, @issue, @post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @artist = Artist.find(params[:artist_id])
    @issue = Issue.find(params[:issue_id])
    @post = @issue.posts.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to admin_artist_issue_url(@artist, @issue), notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:name, :description, :body, :issue_id, :post_image).merge(user_id: current_user.id)
    end
end
