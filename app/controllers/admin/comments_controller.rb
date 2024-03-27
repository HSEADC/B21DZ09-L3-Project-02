class Admin::CommentsController < ApplicationController
    before_action :set_comment, only: %i[ show edit update destroy ]
    load_and_authorize_resource

    # GET /comments or /comments.json
    def index
        @comments = Comment.all
    end

    # GET /comments/1 or /comments/1.json
    def show
    end

    # GET /comments/new
    def new
        @post = Post.find(params[:post_id])
        @comment = Comment.new
    end

    # GET /comments/1/edit
    def edit
        @post = @comment.post
    end

    def create
        @artist = Artist.find(params[:artist_id])
        @issue = Issue.find(params[:issue_id])
        @post = Post.find(params[:post_id])
		#@comment = @post.comments.create(params[:comment])
		@comment = @post.comments.create(params[:comment].permit(:commenter, :body).merge(user_id: current_user.id))
		redirect_to admin_artist_issue_post_url(:admin, @artist, @issue, @post)
	end

    def destroy
        @artist = Artist.find(params[:artist_id])
        @issue = Issue.find(params[:issue_id])
        @post = Post.find(params[:post_id])
        @comment = Comment.find(params[:id])
		@comment.destroy
        respond_to do |format|
            format.html { redirect_to admin_artist_issue_post_url(:admin, @artist, @issue, @post), notice: "Comment was successfully destroyed." }
            format.json { head :no_content }
        end
	end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:commenter, :body).merge(user_id: current_user.id)
    end
end
