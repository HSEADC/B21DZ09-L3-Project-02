class CommentsController < ApplicationController
    def create
        @artist = Artist.find(params[:artist_id])
        @issue = Issue.find(params[:issue_id])
        @post = Post.find(params[:post_id])
		#@comment = @post.comments.create(params[:comment])
		@comment = @post.comments.create(params[:comment].permit(:commenter, :body).merge(user_id: current_user.id))
		redirect_to artist_issue_post_url(@artist, @issue, @post)
	end

    def destroy
        @artist = Artist.find(params[:artist_id])
        @issue = Issue.find(params[:issue_id])
        @post = Post.find(params[:post_id])
        @comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to artist_issue_post_url(@artist, @issue, @post)
	end
end
