class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @issue = Issue.find(params[:issue_id])
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @issue = Issue.find(params[:issue_id])
    @post = @issue.posts.create(params[:post].permit(:title, :artist, :description, :body, :user_id))

    respond_to do |format|
      if @post.save
        format.html { redirect_to issue_url(@issue), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @issue = @post.issue
    @post.destroy

    respond_to do |format|
      format.html { redirect_to issue_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:issue_id])
      # unless @post = Post.where(id: params[:post_id]).first
      #   redirect_to issue_path, flash: {alert: "Post doesn't exists"}
      # end
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :artist, :description, :body, :user_id)
    end
end
